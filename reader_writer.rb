module ReaderWriter
  def self.read_file(filename)
    if File.exist?(filename)
      content = File.read(filename)
      JSON.parse(content)
    else
      puts "File #{filename} is not exist."
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
    return if data.empty?

    # handle the case when directory is not exist
    Dir.mkdir('./data') unless File.directory?('./data')

    File.write("./data/#{filename}", JSON.pretty_generate(data))
  end
end
