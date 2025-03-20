# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# カテゴリーのシードデータ
categories = [
    {
      name: '予測・コントロール可能',
      description: '事前に予測でき、自分の行動で防げた失敗'
    },
    {
      name: '予測不可・コントロール可能',
      description: '予測できなかったが、対応することは可能だった失敗'
    },
    {
      name: '予測可能・コントロール不可',
      description: '予測はできたが、防ぐことができなかった失敗'
    },
    {
      name: '予測・コントロール不可',
      description: '予測もコントロールもできなかった失敗'
    }
  ]
  
  categories.each do |category|
    Category.find_or_create_by!(name: category[:name]) do |c|
      c.description = category[:description]
    end
  end

# 偉人データ
perspectives = [
  {
    name: 'アルベルト・アインシュタイン',
    characteristics: '創造性、好奇心、直感的思考',
    quote: '同じことを繰り返しながら、違う結果を期待するのは狂気の定義である。'
  },
  {
    name: 'スティーブ・ジョブズ',
    characteristics: '完璧主義、直感、シンプルさの追求',
    quote: '失敗を恐れるな。それは成功への道しるべだ。'
  },
  {
    name: '孔子',
    characteristics: '道徳的思考、調和の重視、実践的知恵',
    quote: '過ちを改めざる、これを過ちという。'
  },
  {
    name: 'マリー・キュリー',
    characteristics: '粘り強さ、科学的思考、謙虚さ',
    quote: '人生に恐れるものなど何もない。理解すべきものがあるだけだ。'
  },
  {
    name: 'レオナルド・ダ・ヴィンチ',
    characteristics: '観察力、多様な興味、創造的思考',
    quote: '経験は決して間違いを犯さない。間違うのは判断だけだ。'
  },
  {
    name: 'ヘレン・ケラー',
    characteristics: '楽観主義、忍耐力、決断力',
    quote: '安全とは幻想に過ぎない。冒険なくして進歩はない。'
  }
]

perspectives.each do |perspective|
  Perspective.find_or_create_by!(name: perspective[:name]) do |p|
    p.characteristics = perspective[:characteristics]
    p.quote = perspective[:quote]
  end
end 