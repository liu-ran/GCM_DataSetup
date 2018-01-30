function [ocean_state] = HYCOM_netcdf_to_structure( netcdf_file )


  ocean_state.temperature = ncread( netcdf_file, ' 
