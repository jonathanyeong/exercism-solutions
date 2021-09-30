def sub_query(blueprint, depth=0)
  puts "blueprint is: #{blueprint} and depth: #{depth}"
  blueprint.each_with_index do |criterion, index|
    puts "criterion is #{criterion}, index is #{index}"
    if criterion[:depth] > depth
      sub_query(blueprint.slice(index, blueprint.length), depth + 1)
    end
  end
end

blueprint = [ { id: 1, depth: 0 }, { id:2, depth: 0}, {id:3, depth: 1}, {id:4, depth: 1}]

s = sub_query(blueprint)

puts "sub_query: #{s}"