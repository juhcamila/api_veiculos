class Veiculo < ApplicationRecord
  validates :marca, :veiculo, :ano, :descricao, presence: true
  validates :marca, :veiculo, length: {maximum: 40}
  validates :ano, numericality: {less_than: 2022, greater_than: 1965, only_integer: true}
  validates :vendido, inclusion: {in: ["true", true, 1, "false", false, 0]}
  validates :descricao, length: {maximum: 255}
end
