require './bank_account'

describe BankAccount do
  context "has a balance" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    it "is created with an opening balance and the name of the client" do
      expect(account).to be_a(BankAccount)
    end

    it "can report it's balance" do
      expect(account.balance).to eq(500)
    end

  end

  context "making a deposit" do
    let(:account) do
      account = BankAccount.new(300, "Pio")
      account.deposit(20)
      account
    end
    it "balance is increased" do
      expect(account.balance).to eq(320)
    end
  end

  context "making a withdrawal" do
    let(:account) do
      account = BankAccount.new(900, "Pedro")
      account.withdraw(100)
      account
    end
    it "balance is decreased" do
      expect(account.balance).to eq(800)
    end
  end

  context "transferring funds" do
    let(:account) do
      account = BankAccount.new(300, "Pio")
    end

    let(:account2) do
      account = BankAccount.new(200, "Fido")
    end

    before :each do
      account.transfer(90, account2)
    end

    it "account balance is decreased" do
      expect(account.balance).to eq(210)
    end

    it "other account balance is increased" do
      expect(account2.balance).to eq(290)
    end

  end

  context "minimum balance" do
    it "raises an error if opening balance is too low" do
      expect { BankAccount.new(100, "Sarah") }.to raise_error(ArgumentError)
    end

    it "does NOT raise an error if opening balance is over minimum balance" do
      expect { BankAccount.new(300, "Pio") }.not_to raise_error
    end

    it "allows the bank owner to change the minimum balance" do
      BankAccount.minimum_balance=(210)
      expect{ BankAccount.new(205, "Pio")}.to raise_error(ArgumentError)
      expect{ BankAccount.new(210, "Pio")}.not_to raise_error
    end
  end
end
