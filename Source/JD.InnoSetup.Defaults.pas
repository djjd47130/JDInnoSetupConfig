unit JD.InnoSetup.Defaults;

interface

uses
  JD.InnoSetup.Common;

const
  DEF_COMPRESSION = TJDISCompression.iscLzma2Max;
  DEF_COMPRESSION_VER = 1;
  DEF_COMPRESSION_THREADS = 0;
  DEF_INTERNAL_COMPRESS_LEVEL = TJDISInternalCompression.isicNormal;
  DEF_LZMA_BLOCK_THREADS = 1;
  DEF_LZMA_USE_SEPARATE_PROCESS = TJDISCompressSeparateProcess.iscspDefault;
  DEF_SOLID_COMPRESSION = TBoolDef.bdDefault;


  DEF_SIGN_TOOL_MIN_TIME_BETWEEN = 0;
  DEF_SIGN_TOOL_RETRY_COUNT = 2;
  DEF_SIGN_TOOL_RETRY_DELAY = 500;
  DEF_SIGN_TOOL_RUN_MINIMIZED = TBoolDef.bdDefault;


  DEF_ASLR_COMPATIBLE = TBoolDef.bdDefault;
  DEF_DEP_COMPATIBLE = TBoolDef.bdDefault;
  DEF_DISK_CLUSTER_SIZE = 512;
  DEF_DISK_SLICE_SIZE = 2100000000;
  DEF_DISK_SPANNING = TBoolDef.bdDefault;
  DEF_ENCRYPTION = TBoolDef.bdDefault;
  DEF_MERGE_DUPLICATE_FILES = TBoolDef.bdDefault;
  DEF_OUTPUT = TBoolDef.bdDefault;
  DEF_RESERVE_BYTES = 0;
  DEF_SLICES_PER_DISK = 1;
  DEF_TERMINAL_SERVICES_AWARE = TBoolDef.bdDefault;
  DEF_USED_USER_AREA_WARNING = TBoolDef.bdDefault;
  DEF_USE_SETUP_LDR = TBoolDef.bdDefault;


  DEF_ALLOW_CANCEL_DURING_INSTALL = TBoolDef.bdDefault;
  DEF_ALLOW_NETWORK_DRIVE = TBoolDef.bdDefault;
  DEF_ALLOW_NO_ICONS = TBoolDef.bdDefault;
  DEF_ALLOW_ROOT_DIRECTORY = TBoolDef.bdDefault;
  DEF_ALLOW_UNC_PATH = TBoolDef.bdDefault;
  DEF_ALWAYS_RESTART = TBoolDef.bdDefault;
  DEF_ALWAYS_SHOW_COMP_LIST = TBoolDef.bdDefault;
  DEF_ALWAYS_SHOW_DIR_ON_READY_PAGE = TBoolDef.bdDefault;
  DEF_ALWAYS_SHOW_GROUP_ON_READY_PAGE = TBoolDef.bdDefault;
  DEF_ALWAYS_USE_PERSONAL_GROUP = TBoolDef.bdDefault;
  DEF_APPEND_DEFAULT_DIR_NAME = TBoolDef.bdDefault;
  DEF_APPEND_DEFAULT_GROUP_NAME = TBoolDef.bdDefault;





implementation

end.
