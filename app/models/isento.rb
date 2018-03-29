require 'csv'

class Isento

  def self.verificar(documento)
    begin
      csv_file = File.read(Rails.root.join('lib', 'isentos.csv'))
      csv = CSV.parse(csv_file)
      csv.each do |row|
        if row.first.present?
          if row.first.strip == documento
            return true
          end
        end
      end
    rescue Errno::ENOENT
    end
    false
  end

end
