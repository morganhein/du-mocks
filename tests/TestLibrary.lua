#!/usr/bin/env lua
--- Tests on dumocks.Library.
-- @see dumocks.Library

-- set search path to include root of project
package.path = package.path..";../?.lua"

local lu = require("luaunit")

local ml = require("dumocks.Library")

TestLibrary = {}

--- Verify results pre-load properly for systemResolution3.
function TestLibrary.testSystemResolution3()
    local library = ml:new()
    local closure = library:mockGetClosure()
    local expected, actual

    local resultSequence = {}
    resultSequence[1] = {1, 2, 3}
    resultSequence[2] = {2, 3, 4}

    -- load results in order into solutions list
    table.insert(library.systemResolution3Solutions, resultSequence[1])
    table.insert(library.systemResolution3Solutions, resultSequence[2])

    expected = resultSequence[1]
    actual = closure.systemResolution3({1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {0, 1, 2})
    lu.assertEquals(actual, expected)

    expected = resultSequence[2]
    actual = closure.systemResolution3({1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {0, 1, 2})
    lu.assertEquals(actual, expected)
end

--- Verify error when attempting to run without loading results.
function TestLibrary.testSystemResolution3Error()
    local library = ml:new()
    local closure = library:mockGetClosure()

    -- no results primed
    lu.assertErrorMsgContains("Solution 1 not loaded.", closure.systemResolution3, {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {0, 1, 2})
end

--- Verify results pre-load properly for systemResolution2.
function TestLibrary.testSystemResolution2()
    local library = ml:new()
    local closure = library:mockGetClosure()
    local expected, actual

    local resultSequence = {}
    resultSequence[1] = {1, 2}
    resultSequence[2] = {2, 3}

    -- load results in order into solutions list
    table.insert(library.systemResolution2Solutions, resultSequence[1])
    table.insert(library.systemResolution2Solutions, resultSequence[2])

    expected = resultSequence[1]
    actual = closure.systemResolution2({1, 2, 3}, {4, 5, 6}, {7, 8, 9})
    lu.assertEquals(actual, expected)

    expected = resultSequence[2]
    actual = closure.systemResolution2({1, 2, 3}, {4, 5, 6}, {7, 8, 9})
    lu.assertEquals(actual, expected)
end

--- Verify error when attempting to run without loading results.
function TestLibrary.testSystemResolution2Error()
    local library = ml:new()
    local closure = library:mockGetClosure()

    -- no results primed
    lu.assertErrorMsgContains("Solution 1 not loaded.", closure.systemResolution2, {1, 2, 3}, {4, 5, 6}, {7, 8, 9})
end

os.exit(lu.LuaUnit.run())