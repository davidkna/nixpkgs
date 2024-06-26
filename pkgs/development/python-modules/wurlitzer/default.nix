{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "wurlitzer";
  version = "3.1.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sx07GKtrg5SzrbiyGEGtbUtrsZW5tkKVOHLburTCmyo=";
  };

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "wurlitzer" ];

  pytestFlagsArray = [ "test.py" ];

  meta = with lib; {
    description = "Capture C-level output in context managers";
    homepage = "https://github.com/minrk/wurlitzer";
    changelog = "https://github.com/minrk/wurlitzer/blob/{version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
