class EpisodeSerializer < ActiveModel::Serializer
  attributes :episode_no, :title, :link, :description, :subtitle, :cast

  def cast
    member_ids = object.contributions.map { |contrib| contrib.cast_member_id }.flatten
    CastMember.find(member_ids).map { |member|
      ::CastMemberSerializer.new(member).attributes
    }
  end
end
