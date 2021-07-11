defmodule CzHealth do

  alias CzHealth.Health.Update, as: UpdateStatus

  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        {_status, list} = JSON.decode(payload)
        UpdateStatus.call(list)
        wait_for_messages()
    end
  end
end

{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "cz_health_in")
AMQP.Basic.consume(channel, "cz_health_in", nil, no_ack: true)
IO.puts " [*] Waiting for messages. To exit press CTRL+C, CTRL+C"

CzHealth.wait_for_messages()
