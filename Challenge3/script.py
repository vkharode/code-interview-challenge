import json


def get_value(inputObject, key):
    """get the key value from the json object"""
    objectKeys = key.split('/')
    try:
        value = inputObject[objectKeys[0]]
        for key in objectKeys[1:]:
            value = value[key]
        if isinstance(value, dict):
            print("more nested objects are there")
            return None
        return value
    except Exception as err:
        print("Key value not present")
        return None


def validate_input_json(inputObject):
    """validate input json object"""
    try:
        json.loads(inputObject)
        return True
    except Exception as err:
        return False


def validate_key_name(key):
    """validate key name whose value is asked"""
    if key.startswith('/') or key.endswith('/'):
        return False
    else:
        return True


if __name__ == '__main__':
    inputJSON = input('Enter JSON object:')
    if validate_input_json(inputJSON):
        keyName = input('Enter key name:')
        if validate_key_name(keyName):
            print(get_value(json.loads(inputJSON), keyName))
        else:
            print("wrong key format provided")
    else:
        print("wrong input json is provided")
