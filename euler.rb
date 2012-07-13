def problem_1(ceiling)
  sum = 0
  1.upto(ceiling) do |n|
    sum += n if n % 3 == 0 or n % 5 == 0
  end
  return sum
end

def problem_2(ceiling)
  sum = 0
  fib = [1, 1]
  while true
    n = fib[fib.length - 1] + fib[fib.length - 2]
    return sum if n > ceiling

    sum += n if n % 2 == 0 
    fib.push(n)
    fib.shift
  end
end

def problem_3(n)
  2.upto(n ** 0.5) do |i|
    return [i, problem_3(n/i)].max if n % i == 0
  end
  return n
end

def problem_4(min_factor, max_factor)
  # Unoptimized.
  max_palindrome = 0
  max_factor.downto(min_factor) do |x|
    x.downto(min_factor) do |y|
      product = x * y
      if product.to_s == product.to_s.reverse and product > max_palindrome
        max_palindrome = product
      end
    end
  end
  return max_palindrome
end

def problem_5(max_divisor)
  # Unoptimized.
  number = 0
  number_found = false
  while not number_found
    number += max_divisor
    number_found = true
    2.upto(max_divisor) do |divisor|
      if number % divisor != 0
        number_found = false
        break
      end
    end
  end
  return number
end

def problem_6(ceiling)
  range = 1..ceiling
  return range.inject(:+) ** 2 -
    range.inject(0) { |sum, element| sum + element ** 2 }
end

def problem_7(n)
  # Unoptimized.
  count = 0
  x = 1
  while count < n
    x += 1
    count += 1 if x == problem_3(x)
  end
  return x
end

def problem_8(n)
  str_n = n.to_s
  digits = []
  str_n.slice!(0..4).chars do |digit|
    digits.push(digit.to_i)
  end
  max_product = current_product = digits.inject(:*)

  str_n.chars do |digit|
    digits.push(digit.to_i)
    if digits[0] == 0
      current_product = digits[1...digits.count].inject(:*)
    else
      current_product = current_product / digits[0] * digits[-1]
    end
    digits.shift
    max_product = [max_product, current_product].max
  end
  return max_product
end

def problem_9(n)
  1.upto(n / 3) do |a|
    (a + 1).upto(n / 2) do |b|
      c = n - a - b
      return a * b * c if a ** 2 + b ** 2 == c ** 2
    end
  end
end

def problem_10(n)
  sieve = Hash.new
  2.upto(n) {|x| sieve[x] = true}
  p = 2
  while p < n ** 0.5
    (2 * p).step(n, p) {|x| sieve.delete(x)}
    p += 1
  end
  return sieve.keys.inject(:+)
end


if __FILE__ == $0
  #puts "Problem 1: #{problem_1(999)}"
  #puts "Problem 2: #{problem_2(4000000)}"
  puts "Problem 3: #{problem_3(600851475143)}"
  #puts "Problem 4: #{problem_4(100, 999)}"
  #puts "Problem 5: #{problem_5(20)}"
  #puts "Problem 6: #{problem_6(100)}"
  #puts "Problem 7: #{problem_7(10001)}"
=begin
  puts "Problem 8: #{problem_8(("7316717653133062491922511967442657474235534" +
    "91949349698352031277450632623957831801698480186947885184385861560789112" +
    "94949545950173795833195285320880551112540698747158523863050715693290963" +
    "29522744304355766896648950445244523161731856403098711121722383113622298" +
    "93423380308135336276614282806444486645238749303589072962904915604407723" +
    "90713810515859307960866701724271218839987979087922749219016997208880937" +
    "76657273330010533678812202354218097512545405947522435258490771167055601" +
    "36048395864467063244157221553975369781797784617406495514929086256932197" +
    "84686224828397224137565705605749026140797296865241453510047482166370484" +
    "40319989000889524345065854122758866688116427171479924442928230863465674" +
    "81391912316282458617866458359124566529476545682848912883142607690042242" +
    "19022671055626321111109370544217506941658960408071984038509624554443629" +
    "81230987879927244284909188845801561660979191338754992005240636899125607" +
    "17606058861164671094050775410022569831552000559357297257163626956188267" +
    "0428252483600823257530420752963450").to_i)}"
=end
  #puts "Problem 9: #{problem_9(1000)}"
  puts "Problem 10: #{problem_10(2000000)}"
end
