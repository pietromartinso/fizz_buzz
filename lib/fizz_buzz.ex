defmodule FizzBuzz do
  # def build(file_name) do
  #   case File.read(file_name) do
  #     {:ok, result} -> result # pattern 1: deu tudo certo, retorna o result (arquivo em si)
  #     {:error, reason} -> reason # pattern 2: deu tudo errado, retorna o motivo (identificador do erro)
  #   end
  # end

  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}), do: result

  def handle_file_read({:error, reason}), do: reason

end
