defmodule Undercity.AuctionsTest do
  use Undercity.DataCase

  alias Undercity.Auctions

  describe "auctions" do
    alias Undercity.Auctions.Auction

    import Undercity.AuctionsFixtures

    @invalid_attrs %{buyout_price: nil, description: nil, expiration_date: nil, initial_price: nil, seller_id: nil}

    test "list_auctions/0 returns all auctions" do
      auction = auction_fixture()
      assert Auctions.list_auctions() == [auction]
    end

    test "get_auction!/1 returns the auction with given id" do
      auction = auction_fixture()
      assert Auctions.get_auction!(auction.id) == auction
    end

    test "create_auction/1 with valid data creates a auction" do
      valid_attrs = %{buyout_price: 120.5, description: "some description", expiration_date: ~U[2022-05-16 11:47:00Z], initial_price: 120.5, seller_id: 42}

      assert {:ok, %Auction{} = auction} = Auctions.create_auction(valid_attrs)
      assert auction.buyout_price == 120.5
      assert auction.description == "some description"
      assert auction.expiration_date == ~U[2022-05-16 11:47:00Z]
      assert auction.initial_price == 120.5
      assert auction.seller_id == 42
    end

    test "create_auction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auctions.create_auction(@invalid_attrs)
    end

    test "update_auction/2 with valid data updates the auction" do
      auction = auction_fixture()
      update_attrs = %{buyout_price: 456.7, description: "some updated description", expiration_date: ~U[2022-05-17 11:47:00Z], initial_price: 456.7, seller_id: 43}

      assert {:ok, %Auction{} = auction} = Auctions.update_auction(auction, update_attrs)
      assert auction.buyout_price == 456.7
      assert auction.description == "some updated description"
      assert auction.expiration_date == ~U[2022-05-17 11:47:00Z]
      assert auction.initial_price == 456.7
      assert auction.seller_id == 43
    end

    test "update_auction/2 with invalid data returns error changeset" do
      auction = auction_fixture()
      assert {:error, %Ecto.Changeset{}} = Auctions.update_auction(auction, @invalid_attrs)
      assert auction == Auctions.get_auction!(auction.id)
    end

    test "delete_auction/1 deletes the auction" do
      auction = auction_fixture()
      assert {:ok, %Auction{}} = Auctions.delete_auction(auction)
      assert_raise Ecto.NoResultsError, fn -> Auctions.get_auction!(auction.id) end
    end

    test "change_auction/1 returns a auction changeset" do
      auction = auction_fixture()
      assert %Ecto.Changeset{} = Auctions.change_auction(auction)
    end
  end
end
