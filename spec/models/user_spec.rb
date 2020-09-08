require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user =  FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it "nicname,email,password,password_confirmation,family_name,last_name.family_name_kana,last_name_kanaが存在しているとき" do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき'do
      it 'nicknameが空のとき'do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空のとき'do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が入っていないとき'do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
        it 'passwordが空のとき'do
        @user.password = ""
        @user.password_confirmation =@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
       end
      it 'passwordが英字のみのとき'do
        @user.password = "aaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください", "Password confirmation には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが数字のみのとき'do
        @user.password = "1111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください", "Password confirmation には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが5文字以下のとき'do
        @user.password ="a1111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is too short (minimum is 6 characters)", "Password confirmation is too short (minimum is 6 characters)")
      end
    
      it 'family_nameが空のとき'do
        @user.family_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name can't be blank", "Family name 全角文字を使用してください")
      end
      it 'family_nameが全角ではないとき'do
        @user.family_name ="ymada"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name 全角文字を使用してください")
      end
      it 'last_nameが空のとき'do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name can't be blank", "Last name 全角文字を使用してください")
      end
      it 'last_nameが全角ではないとき'do
        @user.last_name = "rikutarou"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name 全角文字を使用してください")
      end
      it'family_name_kanaが空のとき'do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name kana can't be blank", "Family name kana 全角文字を使用してください")
      end
      it'family_name_kanaが全角ではないとき'do
        @user.family_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name kana 全角文字を使用してください")
      end
      it 'last_name_kanaが空のとき'do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name kana can't be blank", "Last name kana 全角文字を使用してください")
      end
      it 'last_name_kanaが全角ではないとき'do
        @user.last_name_kana = "rikutarou"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name kana 全角文字を使用してください")
      end
      it 'birthdayが空のとき'do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Birthday can't be blank")
      end
    end
  end
 
end
