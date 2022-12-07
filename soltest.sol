 pragma solidity >= 0.6.0;

    contract ETHDepositWithdraw {
        address payable public owner;
        mapping(address => uint) public balances;
        mapping(address => uint) public depositHistory;
        mapping(address => uint) public withdrawnHistory;
        
        constructor() public {
            owner = msg.sender;
        }
        
        function deposit() public payable {
            require(msg.value > 0, "Deposit amount must be greater than 0");
            balances[msg.sender] += msg.value;
            depositHistory[msg.sender] += msg.value;
        }
        
        function withdraw(uint amount) public {
            require(balances[msg.sender] >= amount, "Insufficient funds");
            balances[msg.sender] -= amount;
            withdrawnHistory[msg.sender] += amount;
            msg.sender.transfer(amount);
        }
        
        function getBalance() public view returns (uint) {
            return balances[msg.sender];
        }
        
        function getDepositHistory() public view returns
    }