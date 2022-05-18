defmodule Undercity.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :contents, :string
    belongs_to :user, Undercity.Users.User
    belongs_to :recipient, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:user_id, :recipient_id, :contents])
    |> validate_required([:user_id, :recipient_id, :contents])
  end
end
