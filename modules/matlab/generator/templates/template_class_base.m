% {{class.name | upper}}
% Matlab handle class for OpenCV object classes
classdef {{class.name}} < handle
  properties (SetAccess = private, Hidden = true)
    ptr_ = 0; % handle to the underlying c++ class instance
  end
  
  methods
    % constructor
    function this = {{class.name}}(varargin)
      this.ptr_ = {{class.name}}Bridge('new', varargin{:});
    end

    % destructor
    function delete(this)
      {{className}}Bridge(this.ptr_, 'delete');
    end

    {% for function in class.functions %}
    % {{function.__str__()}}
    function varargout = {{function.name}}(this, varargin)
      [varargout{1:nargout}] = {{class.name}}Bridge('{{function.name}}', this.ptr_, varargin{:});
    end

    {% endfor %}
  end
end
