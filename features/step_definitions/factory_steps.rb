 FactoryGirl.factories.each do |factory|
  factory.human_names.each do |human_name|
    Given /^(\d+) (?:#{human_name}|#{human_name.pluralize}) exists? with the following:$/i do |count, table|
      count.to_i.times do
        table.hashes.each do |human_hash|
          attributes = convert_human_hash_to_attribute_hash(human_hash, factory.associations)
          FactoryGirl.create(factory.name, attributes)
        end
      end
    end
  end
end