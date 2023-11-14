// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Simple Student DataBase with Function and Error Handlers in Solidity Smart Contract
 * @author Marcellus Ifeanyi
 * @notice This demostrates understanding and the use of `require()`, `assert()` and `revert()` to handle errors in solidity smart contract
 * @dev This is a smart contract that implements the require(), assert() and revert() statements for error handling
 */

contract StudentDatabase {
    error ProfileDoesNotExist();

    struct Student {
        string name;
        uint256 age;
        string techStack;
    }

    mapping(address => Student) public students;

    function createStudentProfile(
        string memory _name,
        uint256 _age,
        string memory _techStack
    ) public {
        require(bytes(_name).length > 4, "Name greater than 4 letters");

        require(_age != 0, "Age cannot be Zero");

        require(
            bytes(_techStack).length > 4,
            "TechStack  greater than 4 letters"
        );

        students[msg.sender] = Student(_name, _age, _techStack);
    }

    function confirmStudentName(string calldata _name) public view {
        string memory name = students[msg.sender].name;
        assert(
            keccak256(abi.encodePacked(name)) ==
                keccak256(abi.encodePacked(_name))
        );
    }

    function confirmStudentAge(uint _age) public view {
        assert(students[msg.sender].age == _age);
    }

    function confirmStudentTechStack(string calldata _techStack) public view {
        string memory techStack = students[msg.sender].techStack;
        assert(
            keccak256(abi.encodePacked(techStack)) ==
                keccak256(abi.encodePacked(_techStack))
        );
    }

    function updateProfile(
        string memory _name,
        uint256 _age,
        string memory _techStack
    ) public {
        require(
            bytes(students[msg.sender].name).length != 0,
            "Profile does not exist"
        );
        students[msg.sender] = Student(_name, _age, _techStack);
    }

    function deleteProfile() public {
        if (bytes(students[msg.sender].name).length == 0)
            revert ProfileDoesNotExist();

        delete students[msg.sender];
    }

    function viewProfile()
        public
        view
        returns (string memory, uint256, string memory)
    {
        if (bytes(students[msg.sender].name).length == 0)
            revert ProfileDoesNotExist();
        return (
            students[msg.sender].name,
            students[msg.sender].age,
            students[msg.sender].techStack
        );
    }
}
