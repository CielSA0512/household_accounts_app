require 'google_drive'

# 認証確認
session = GoogleDrive::Session.from_config("config.json")
