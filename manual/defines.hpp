// IDCs ========================================================================
#define GRAD_ADLERBASE_MANUALIDCLIST                60001
#define GRAD_ADLERBASE_MANUALIDCCONTENTTITLE        60002
#define GRAD_ADLERBASE_MANUALIDCCONTENT             60003
#define GRAD_ADLERBASE_MANUALIDCPLAYERNAME          60004
#define GRAD_ADLERBASE_MANUALIDCCHECKBOX            60005

// DIMENSIONS AND POSITIONS ====================================================
#define grad_adlerBase_manualTotalW                 (1.42 * X_SCALE)
#define grad_adlerBase_manualTotalH                 (0.80 * Y_SCALE)

#define grad_adlerBase_manualButtonW                (0.120 * X_SCALE)
#define grad_adlerBase_manualCheckBoxW              (0.025 * X_SCALE)
#define grad_adlerBase_manualCheckBoxH              (0.025 * Y_SCALE)
#define grad_adlerBase_manualCheckBoxBGW            (0.220 * X_SCALE)
#define grad_adlerBase_manualContentTitleH          (0.060 * Y_SCALE)

#define grad_adlerBase_manualPaddingX               (0.005 * X_SCALE)
#define grad_adlerBase_manualPaddingY               (0.005 * Y_SCALE)

#define grad_adlerBase_manualElementSpacing         (0.0020)
#define grad_adlerBase_manualElementSpacingY        (grad_adlerBase_manualElementSpacing * Y_SCALE)
#define grad_adlerBase_manualElementSpacingX        (grad_adlerBase_manualElementSpacing * X_SCALE)
#define grad_adlerBase_manualBarH                   (0.025 * Y_SCALE)

#define grad_adlerBase_manualListBGW                (grad_adlerBase_manualTotalW * 0.25)
#define grad_adlerBase_manualListW                  (grad_adlerBase_manualListBGW - 2*grad_adlerBase_manualPaddingX)

#define grad_adlerBase_manualContentBGH             (grad_adlerBase_manualTotalH - 2*grad_adlerBase_manualBarH - 2*grad_adlerBase_manualElementSpacingY)
#define grad_adlerBase_manualContentH               (grad_adlerBase_manualContentBGH - 2*grad_adlerBase_manualPaddingY)

#define grad_adlerBase_manualContentBGW             (grad_adlerBase_manualTotalW - grad_adlerBase_manualListBGW - grad_adlerBase_manualElementSpacingX)
#define grad_adlerBase_manualContentW               (grad_adlerBase_manualContentBGW - 2*grad_adlerBase_manualPaddingX)

#define grad_adlerBase_manualTotalX                 CENTER(1,grad_adlerBase_manualTotalW)
#define grad_adlerBase_manualTotalY                 CENTER(1,grad_adlerBase_manualTotalH)

#define grad_adlerBase_manualListBGX                (grad_adlerBase_manualTotalX)
#define grad_adlerBase_manualListX                  (grad_adlerBase_manualListBGX + grad_adlerBase_manualPaddingX)

#define grad_adlerBase_manualListBGY                (grad_adlerBase_manualTotalY + grad_adlerBase_manualBarH + grad_adlerBase_manualElementSpacingY)
#define grad_adlerBase_manualListY                  (grad_adlerBase_manualListBGY + grad_adlerBase_manualPaddingY)

#define grad_adlerBase_manualContentBGX             (grad_adlerBase_manualListBGX + grad_adlerBase_manualListBGW + grad_adlerBase_manualElementSpacingX)
#define grad_adlerBase_manualContentX               (grad_adlerBase_manualContentBGX + grad_adlerBase_manualPaddingX)
#define grad_adlerBase_manualContentBGY             (grad_adlerBase_manualListBGY)
#define grad_adlerBase_manualContentY               (grad_adlerBase_manualListY)

#define grad_adlerBase_manualContentTextY           (grad_adlerBase_manualContentBGY + grad_adlerBase_manualContentTitleH)
#define grad_adlerBase_manualContentTextH           (grad_adlerBase_manualContentH - grad_adlerBase_manualContentTitleH)

#define grad_adlerBase_manualCloseButtonX           (grad_adlerBase_manualTotalX + grad_adlerBase_manualTotalW - grad_adlerBase_manualButtonW)
#define grad_adlerBase_manualCheckBoxBGX            (grad_adlerBase_manualCloseButtonX - grad_adlerBase_manualElementSpacingX - grad_adlerBase_manualCheckBoxBGW)
#define grad_adlerBase_manualButtonY                (grad_adlerBase_manualTotalY + grad_adlerBase_manualTotalH - grad_adlerBase_manualBarH)

#define grad_adlerBase_manualCheckBoxX              (grad_adlerBase_manualCloseButtonX - grad_adlerBase_manualCheckBoxX - grad_adlerBase_manualElementSpacingX)
