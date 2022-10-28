//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract todolist {
    struct TodoItem {
        string text;
        bool completed;
    }

    TodoItem[] public todos;

    function createTodo(string memory _text) public {
        todos.push(TodoItem(_text,false));
    }
    function updateTodo(uint _index, string memory _text) public {
        todos[_index].text = _text; 
    }
    function toggleCompleted(uint _index) public {
        todos[_index].completed = !todos[_index].completed;
    }
}