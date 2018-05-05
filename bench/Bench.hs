{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}

import Criterion.Main
import Data.ByteString(ByteString)
import Data.String

import qualified System.Demangle as D

testData :: IsString a => [(String, a)]
testData = [
    ("simple", "_ZTI5IInfo"),
    ("operator", "_ZrsR11QDataStreamR5QUuid"),
    ("complex", "_ZTSZN10LeechCraft4Util15InstanceFunctorI7QFutureINS0_6EitherIN5boost7variantIN5vmime10exceptions20authentication_errorEJNS7_16connection_errorENS6_8security4cert20certificateExceptionENS_6Snails23GenericExceptionWrapperEEEENSD_19AccountThreadWorker10SyncResultEEEEE5ApplyINS0_7VisitorINS0_4VoidEJZNSD_7Account15SynchronizeImplERK5QListI11QStringListERK10QByteArrayNSD_12TaskPriorityEE3$_1ZNSO_15SynchronizeImplEST_SW_SX_E3$_2EEEEES2_INSt5decayINSt9result_ofIFT_SI_EE4typeEE4typeEERKSJ_RKS13_EUlRKSI_E_"),
    ("rly complex", "_ZN5boost6detail7variant15visitation_implIN4mpl_4int_ILi0EEENS1_20visitation_impl_stepINS_3mpl6l_iterINS7_6l_itemINS3_5long_ILl7EEEN5vmime10exceptions20authentication_errorENS9_INSA_ILl6EEENSD_16connection_errorENS9_INSA_ILl5EEENSC_8security4cert20certificateExceptionENS9_INSA_ILl4EEEN10LeechCraft6Snails23GenericExceptionWrapperENS9_INSA_ILl3EEENSN_15MessageNotFoundENS9_INSA_ILl2EEENSN_13FileOpenErrorENS9_INSA_ILl1EEENSN_18AttachmentNotFoundENS7_5l_endEEEEEEEEEEEEEEEEENS8_ISV_EEEENS1_14invoke_visitorINSM_4Util6detail7VisitorIvJZZNSN_10ThreadPool20PerformScheduledFuncI16QFutureInterfaceINS17_6EitherINS_7variantISE_JSG_SK_SO_SQ_SS_SU_EEENS17_4VoidEEEEMNSN_19AccountThreadWorkerEFNS1D_INS1E_ISQ_JSS_SU_EEES1G_EESt10shared_ptrINSN_7MessageEERK7QStringS1R_EJS1O_S1P_S1P_EEEvPNSN_13AccountThreadET_NSN_12TaskPriorityERKT0_DpRKT1_ENUlS1W_E_clIS1H_EEDaS1W_EUlRKSE_E_ZZNS1B_IS1I_S1T_JS1O_S1P_S1P_EEEvS1V_S1W_S1X_S20_S24_ENS26_IS1H_EEDaS1W_EUlS1W_E_EEEEEPKvNS1F_18has_fallback_type_EEENT1_11result_typeEiiRS2G_T2_NS3_5bool_ILb0EEET3_PS1W_PS1Y_")
  ]

main :: IO ()
main = defaultMain [
    bgroup "demangle string"     [ bench name $ nfIO $ D.demangle @String mangled | (name, mangled) <- testData],
    bgroup "demangle bytestring" [ bench name $ nfIO $ D.demangle @ByteString mangled | (name, mangled) <- testData]
  ]
