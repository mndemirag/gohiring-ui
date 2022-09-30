module CommonAPI
  class Mapper
    def self.call(attributes)
      new.call(attributes)
    end

    def call(attributes)
      {
        reference: attributes.dig('UserArea', 'PostingID'),
        title: attributes['PositionTitle'],
        company_name: attributes['OrganizationName'],
        update_uri: attributes.dig('UserArea', 'PostingURI')
      }
    end
  end
end
