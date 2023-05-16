EXCHANGE_RATES = {
    "USD" => 1.0,
    "EUR" => 0.91,
    "JPY" => 133.85,
    "GBP" => 0.79,
    "AUD" => 1.48
}

EXCHANGE_RATE_INDEX_MAP = {}
EXCHANGE_RATES.each_with_index do |(key, value), index|
    EXCHANGE_RATE_INDEX_MAP[index + 1] = key
end

def convert_currency(amount, from_currency, to_currency)
  (amount / EXCHANGE_RATES[from_currency] * EXCHANGE_RATES[to_currency]).round(2)
end

def length(enumeration)
  return enumeration.values().length
end

def display_choices()
  EXCHANGE_RATES.each_with_index do |(key, value), index|
    puts("#{index + 1}. #{key} => #{value}")
  end
end

def get_input_in_range(prompt, start, stop)
  while (true)
    print(prompt)
    input = gets.chomp.to_i
    if (input == "")
      puts("Invalid input!")
    elsif ((start <= input) and (input <= stop))
      return input
    else
      puts("Invalid input!")
    end
  end
end

quit = false
while (!quit)
  puts("----------------------------------------")
  display_choices()

  from_currency = get_input_in_range("Select a currency to convert from: ", 1, length(EXCHANGE_RATES))
  puts()
  to_currency = get_input_in_range("Select a currency to convert to: ", 1, length(EXCHANGE_RATES))

  print("\nEnter an amount of money in #{EXCHANGE_RATE_INDEX_MAP[from_currency]} that will be converted to #{EXCHANGE_RATE_INDEX_MAP[to_currency]}: ")
  currency_quantity = gets.chomp.to_i

  converted_currancy = convert_currency(currency_quantity, EXCHANGE_RATE_INDEX_MAP[from_currency], EXCHANGE_RATE_INDEX_MAP[to_currency])
  puts("Result: #{converted_currancy} #{EXCHANGE_RATE_INDEX_MAP[to_currency]}")

  puts()
  do_quit = get_input_in_range("Would you like to make another conversion? (1 = yes, 0 = no): ", 0, 1)

  if (do_quit == 0)
    quit = true
    puts("----------------------------------------")
    puts("Quitting...")
  end
end