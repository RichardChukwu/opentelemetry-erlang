defmodule OpenTelemetry.SemConv.Incubating.DiskAttributes do
  # This is an auto-generated file
  @moduledoc """
  OpenTelemetry Semantic Conventions for Disk attributes.
  """

  @typedoc """
  The disk IO operation direction.

  ### Enum Values
  * `:read` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:write` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type disk_io_direction_values() :: %{
          :read => :read,
          :write => :write
        }
  @doc """
  The disk IO operation direction.

  ### Examples

  ```
  ["read"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.DiskAttributes.disk_io_direction()
      :"disk.io.direction"
      
      iex> OpenTelemetry.SemConv.Incubating.DiskAttributes.disk_io_direction_values().read
      :read
      
      iex> %{OpenTelemetry.SemConv.Incubating.DiskAttributes.disk_io_direction() => OpenTelemetry.SemConv.Incubating.DiskAttributes.disk_io_direction_values().read}
      %{:"disk.io.direction" => :read}
      
      iex> OpenTelemetry.SemConv.Incubating.DiskAttributes.disk_io_direction_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?DISK_IO_DIRECTION.
  'disk.io.direction'

  \#{?DISK_IO_DIRECTION => ?'DISK_IO_DIRECTION_VALUES.read'}.
  \#{'disk.io.direction' => read}

  ?'DISK_IO_DIRECTION_VALUES.read'.
  read

  ?DISK_IO_DIRECTION_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec disk_io_direction :: :"disk.io.direction"
  def disk_io_direction do
    :"disk.io.direction"
  end

  @spec disk_io_direction_values() :: disk_io_direction_values()
  def disk_io_direction_values() do
    %{
      :read => :read,
      :write => :write
    }
  end

  @spec disk_io_direction_values(atom() | String.t()) :: atom() | String.t()
  def disk_io_direction_values(custom_value) do
    custom_value
  end
end
