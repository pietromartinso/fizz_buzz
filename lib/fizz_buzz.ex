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

  # Aula 16, 6:28
  # def handle_file_read({:ok, result}) do
  #   #extrai os elementos da string lida do arquivo, separando por vírgula
  #   list = String.split(result, ",")
  #   #Enum.map(list, fn number -> String.to_integer(number) end) # forma convencional de utilizar o Enum.map: fun. anôn.

  #   #converte cada elemento da lista de strings em um integer
  #   Enum.map(list, &String.to_integer/1) # Sintaxe otimizada para quando tenho apenas 1 parâmetro na fun. passada ao Enum.map
  # end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  # Guards (filtros para os argumentos)

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
