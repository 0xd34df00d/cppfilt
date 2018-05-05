{-# LANGUAGE OverloadedStrings #-}

import Criterion.Main

import qualified System.Demangle as D

main :: IO ()
main = defaultMain [
    bgroup "demangle string" [ bench "simple" $ nfIO $ D.demangle "_ZTI5IInfo"
                             , bench "operator" $ nfIO $ D.demangle "_ZrsR11QDataStreamR5QUuid"
                             , bench "complex" $ nfIO $ D.demangle "_ZTSZN10LeechCraft4Util15InstanceFunctorI7QFutureINS0_6EitherIN5boost7variantIN5vmime10exceptions20authentication_errorEJNS7_16connection_errorENS6_8security4cert20certificateExceptionENS_6Snails23GenericExceptionWrapperEEEENSD_19AccountThreadWorker10SyncResultEEEEE5ApplyINS0_7VisitorINS0_4VoidEJZNSD_7Account15SynchronizeImplERK5QListI11QStringListERK10QByteArrayNSD_12TaskPriorityEE3$_1ZNSO_15SynchronizeImplEST_SW_SX_E3$_2EEEEES2_INSt5decayINSt9result_ofIFT_SI_EE4typeEE4typeEERKSJ_RKS13_EUlRKSI_E_"
                             , bench "rly complex" $ nfIO $ D.demangle "_ZN5boost6detail7variant15visitation_implIN4mpl_4int_ILi0EEENS1_20visitation_impl_stepINS_3mpl6l_iterINS7_6l_itemINS3_5long_ILl7EEEN5vmime10exceptions20authentication_errorENS9_INSA_ILl6EEENSD_16connection_errorENS9_INSA_ILl5EEENSC_8security4cert20certificateExceptionENS9_INSA_ILl4EEEN10LeechCraft6Snails23GenericExceptionWrapperENS9_INSA_ILl3EEENSN_15MessageNotFoundENS9_INSA_ILl2EEENSN_13FileOpenErrorENS9_INSA_ILl1EEENSN_18AttachmentNotFoundENS7_5l_endEEEEEEEEEEEEEEEEENS8_ISV_EEEENS1_14invoke_visitorINSM_4Util6detail7VisitorIvJZZNSN_10ThreadPool20PerformScheduledFuncI16QFutureInterfaceINS17_6EitherINS_7variantISE_JSG_SK_SO_SQ_SS_SU_EEENS17_4VoidEEEEMNSN_19AccountThreadWorkerEFNS1D_INS1E_ISQ_JSS_SU_EEES1G_EESt10shared_ptrINSN_7MessageEERK7QStringS1R_EJS1O_S1P_S1P_EEEvPNSN_13AccountThreadET_NSN_12TaskPriorityERKT0_DpRKT1_ENUlS1W_E_clIS1H_EEDaS1W_EUlRKSE_E_ZZNS1B_IS1I_S1T_JS1O_S1P_S1P_EEEvS1V_S1W_S1X_S20_S24_ENS26_IS1H_EEDaS1W_EUlS1W_E_EEEEEPKvNS1F_18has_fallback_type_EEENT1_11result_typeEiiRS2G_T2_NS3_5bool_ILb0EEET3_PS1W_PS1Y_"
                             ],
    bgroup "demangle BS"     [ bench "simple" $ nfIO $ D.demangleBS "_ZTI5IInfo"
                             , bench "operator" $ nfIO $ D.demangleBS "_ZrsR11QDataStreamR5QUuid"
                             , bench "complex" $ nfIO $ D.demangleBS "_ZTSZN10LeechCraft4Util15InstanceFunctorI7QFutureINS0_6EitherIN5boost7variantIN5vmime10exceptions20authentication_errorEJNS7_16connection_errorENS6_8security4cert20certificateExceptionENS_6Snails23GenericExceptionWrapperEEEENSD_19AccountThreadWorker10SyncResultEEEEE5ApplyINS0_7VisitorINS0_4VoidEJZNSD_7Account15SynchronizeImplERK5QListI11QStringListERK10QByteArrayNSD_12TaskPriorityEE3$_1ZNSO_15SynchronizeImplEST_SW_SX_E3$_2EEEEES2_INSt5decayINSt9result_ofIFT_SI_EE4typeEE4typeEERKSJ_RKS13_EUlRKSI_E_"
                             , bench "rly complex" $ nfIO $ D.demangleBS "_ZN5boost6detail7variant15visitation_implIN4mpl_4int_ILi0EEENS1_20visitation_impl_stepINS_3mpl6l_iterINS7_6l_itemINS3_5long_ILl7EEEN5vmime10exceptions20authentication_errorENS9_INSA_ILl6EEENSD_16connection_errorENS9_INSA_ILl5EEENSC_8security4cert20certificateExceptionENS9_INSA_ILl4EEEN10LeechCraft6Snails23GenericExceptionWrapperENS9_INSA_ILl3EEENSN_15MessageNotFoundENS9_INSA_ILl2EEENSN_13FileOpenErrorENS9_INSA_ILl1EEENSN_18AttachmentNotFoundENS7_5l_endEEEEEEEEEEEEEEEEENS8_ISV_EEEENS1_14invoke_visitorINSM_4Util6detail7VisitorIvJZZNSN_10ThreadPool20PerformScheduledFuncI16QFutureInterfaceINS17_6EitherINS_7variantISE_JSG_SK_SO_SQ_SS_SU_EEENS17_4VoidEEEEMNSN_19AccountThreadWorkerEFNS1D_INS1E_ISQ_JSS_SU_EEES1G_EESt10shared_ptrINSN_7MessageEERK7QStringS1R_EJS1O_S1P_S1P_EEEvPNSN_13AccountThreadET_NSN_12TaskPriorityERKT0_DpRKT1_ENUlS1W_E_clIS1H_EEDaS1W_EUlRKSE_E_ZZNS1B_IS1I_S1T_JS1O_S1P_S1P_EEEvS1V_S1W_S1X_S20_S24_ENS26_IS1H_EEDaS1W_EUlS1W_E_EEEEEPKvNS1F_18has_fallback_type_EEENT1_11result_typeEiiRS2G_T2_NS3_5bool_ILb0EEET3_PS1W_PS1Y_"
                             ]
  ]
