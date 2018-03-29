require 'google_drive'

module GoogleDriveAPI
  extend ActiveSupport::Concern

  def questionario_respondido_por?(documento)
    cpf = formatar_cpf(documento)
    session = GoogleDrive::Session.from_service_account_key(Rails.root.join('config', 'google_api_secrets.json'))
    worksheet = session.spreadsheet_by_key(Config.instance.key_planilha_formulario_avaliacao).worksheets[0]

    (2..worksheet.num_rows).each do |row|
      if worksheet[row, 2] == cpf
        return true
      end
    end
    false
  end

  def formatar_cpf(cpf)
    "#{cpf[0..2]}.#{cpf[3..5]}.#{cpf[6..8]}-#{cpf[9..11]}"
  end

end
