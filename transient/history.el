((aider-transient-menu nil)
 (gptel--infix-add-directive "-d " "ssdas ")
 (gptel--infix-confirm-tool-calls t)
 (gptel--infix-provider qwen2.5-coder:3b gpt-3.5-turbo-16k)
 (gptel--infix-rewrite-extra "Rewrite: insertProductOASInfoTemp  add new parameter String oasRepCode send to insertProductInfoOASTemp for update field OAS_REP_CODE in database table TBL_COLL_TEMP_COMMO  " "Rewrite: add parameter  String oasRepCode " "Rewrite: add field OAS_REP_CODE" "Rewrite:  I need support rmId select all non where rmId" "Rewrite: view eg. and new generate findTmpByColl   schema same but table change TBL_COMMODITY  to  TBL_COLL_TEMP_COMMO" "Rewrite:   help create attibute List<Commodity>" "replace null with name data eg. this.eaDistrict" "Rewrite: replace null  to name data eg. eaDistrict : this.eaDistrict" "Rewrite: replace null same format  first line" "Rewrite: remove comment this code")
 (gptel--infix-use-tools t)
 (gptel--rewrite-directive-menu nil)
 (gptel-menu nil
             ("e")
             ("i"))
 (gptel-rewrite nil)
 (gptel-system-prompt nil)
 (gptel-tools nil)
 (magit-branch nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-fetch nil)
 (magit-log
  ("-n256" "--graph" "--decorate"))
 (magit-merge nil)
 (magit-pull nil
             ("--ff-only"))
 (magit-push nil)
 (magit-rebase
  ("--autostash"))
 (magit-revert
  ("--edit"))
 (magit-submodule nil)
 (magit-worktree nil)
 (transient:magit-rebase:--rebase-merges=))
