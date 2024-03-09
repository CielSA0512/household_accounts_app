class SpendsController < ApplicationController
  before_action :set_spreadsheet

  def index
  @data = []
  @total_outflow = Hash.new(0)
  @total_Inflow = Hash.new(0)
  (2..@sp.num_rows).each do |row|
    date = @sp["B#{row}"] 
    next unless date.to_s.split('/')[1] == '03'

    row_data = {}
    row_data['日付'] = date
    row_data['入出金'] = @sp["C#{row}"]
    row_data['項目'] = @sp["D#{row}"]
    row_data['メモ'] = @sp["E#{row}"]
    row_data['入出金方法'] = @sp["F#{row}"]
    row_data['金額'] = @sp["G#{row}"]
      
    amount = @sp["G#{row}"].to_i
    if @sp["C#{row}"] == '出金'
      @total_outflow[date] += amount
    else
      @total_Inflow[date] += amount
    end
      
    @data << row_data 
  end

  if params[:query].present?
    query = Regexp.new(params[:query], Regexp::IGNORECASE)
    @data = @data.select { |row| row.values.any? { |value| value.to_s.match?(query) } }
  end
  end

  private
  def set_spreadsheet
    session = GoogleDrive::Session.from_config("config.json")
    @sp = session.spreadsheet_by_url(ENV["SPREAD_URL"]).worksheet_by_title("フォームの回答 1")
  end
end
 