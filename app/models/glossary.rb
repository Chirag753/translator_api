class Glossary < ApplicationRecord
  VALID_ISO_639_1_CODES = %w(aa ab ae af ak am an ar as av ay az ba be bg bi bm bn bo br bs ca ce ch co cr cs cv cy da de dv dz ee en eo es et eu fa ff fi fj fo fr fy ga gl gn gu gv ha he hi ho hr hu hy hz ia id ie ig ik io is it iu ja jv ka kg kj kk kl km kn ko kr ks ku kv kw la lb lg ln lo lt lu lv mg mh mi mk ml mn mr ms mt my na ne ng nl no oj om or os pa pi pl ps pt qu rm rn ro ru rw sa sc sd se sg sk sl sm sn so sq sr ss su sv sw ta te tg th ti tk tl tn to tr ts tt tw ty ug uk ur uz ve vi wa wo xh yi yo za zh zu).freeze
  has_many :terms
  validates :source_language_code, :target_language_code, presence: true, inclusion: { in: VALID_ISO_639_1_CODES }
  validates :source_language_code, uniqueness: { scope: :target_language_code, message: "The combination of source and target language must be unique" }
end
