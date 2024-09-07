defmodule Spire.Repo.Migrations.AddUniqueNameConstraintToTags do
  use Ecto.Migration

  def change do
    create unique_index(:tags, [:name])
  end
end
