class AddColumnParticipantIdToRoom < ActiveRecord::Migration[7.2]
  def change
    add_column :rooms, :participant_id, :integer
  end
end
