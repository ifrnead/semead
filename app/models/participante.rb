# encoding: utf-8

class Participante < ActiveRecord::Base
  belongs_to :tipo_participante
  belongs_to :cidade
  belongs_to :pais

  validates :nome, :email, :senha, :pais_id, :documento, :tipo_participante_id, :instituicao, presence: true
  validates :email, uniqueness: true, email: true
  validates :cidade_id, presence: true, if: "pais_id == 33"
  validates :documento, cpf: true, if: "pais_id == 33"
  validates :senha, length: { minimum: 4 }
end
