module ReaderWriter
  def self.read_file(filename)
    if File.exist?(filename)
      content = File.read(filename)
      JSON.parse(content)
    else
      puts "#{filename} file is not exist."
    end
  end

  def self.save(list, filename)
    data = []
    list.each do |item|
      object = {}
      item.instance_variables.each do |var|
        object[var.to_s.delete('@')] = item.instance_variable_get(var).to_s
      end
      data.push(object)
    end
    return if data.empty

    File.write("./data/3{filename}", JSON.pretty_generate(data))
  end
end
