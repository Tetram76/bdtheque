object frmPrevisionsAchats: TfrmPrevisionsAchats
  Left = 262
  Top = 208
  Caption = 'Achats pr'#233'vus'
  ClientHeight = 594
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object vstPrevisionsAchats: TVirtualStringTree
    Left = 0
    Top = 56
    Width = 862
    Height = 538
    Align = alClient
    BevelKind = bkTile
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    HotCursor = crHandPoint
    ParentFont = False
    TabOrder = 0
    OnPaintText = vstPrevisionsAchatsPaintText
    Columns = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 56
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 61
      Height = 13
      Caption = 'Grouper par '
      Transparent = True
    end
    object LightComboCheck1: TLightComboCheck
      Left = 70
      Top = 1
      Width = 140
      Height = 19
      Checked = True
      Border = CCBflat
      DefaultValueChecked = -1
      PropertiesStored = True
      Transparent = True
      CheckVisible = False
      FillCaption = False
      CheckedCaptionBold = False
      OnChange = LightComboCheck1Change
      ShowCaptionHint = False
      AssignHint = False
      OptionValidValue.ValueOption = [vvoChecked, vvoUnchecked, vvoMissing, vvoUnknown, vvoOthers]
      Items.CaptionComplet = True
      Items.Separateur = ' '
      Items = <
        item
          Valeur = 0
          Caption = 'Titre'
          Visible = True
          Enabled = True
          SubItems.CaptionComplet = True
          SubItems.Separateur = ' '
          SubItems = <>
        end
        item
          Valeur = 1
          Caption = 'S'#233'rie'
          Visible = True
          Enabled = True
          SubItems.CaptionComplet = True
          SubItems.Separateur = ' '
          SubItems = <>
        end
        item
          Valeur = 2
          Caption = 'Editeur'
          Visible = True
          Enabled = True
          SubItems.CaptionComplet = True
          SubItems.Separateur = ' '
          SubItems = <>
        end
        item
          Valeur = 3
          Caption = 'Genre'
          Visible = True
          Enabled = True
          SubItems.CaptionComplet = True
          SubItems.Separateur = ' '
          SubItems = <>
        end
        item
          Valeur = 4
          Caption = 'Ann'#233'e de parution'
          Visible = True
          Enabled = True
          SubItems.CaptionComplet = True
          SubItems.Separateur = ' '
          SubItems = <>
        end
        item
          Valeur = 5
          Caption = 'Collection'
          Visible = True
          Enabled = True
          SubItems.CaptionComplet = True
          SubItems.Separateur = ' '
          SubItems = <>
        end>
    end
    object supprimer: TVDTButton
      Left = 181
      Top = 30
      Width = 88
      Height = 25
      Action = actSupprimer
      Margin = 2
      Spacing = -1
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
        3B0000000473424954080808087C0864880000001974455874536F6674776172
        65007777772E696E6B73636170652E6F72679BEE3C1A000004774944415478DA
        8D947B4C5B7514C7BF97B6D0D75A684BDFA5BC4A190F335E038438912C2E5B36
        276A64C4F8CE58E6123523CB62A2C6F987A289CCA8C14734FB6759C23081E8D8
        9431C6461CE2C29630C7AB74C058813E282DA52F7AEFF5877308B6384E727273
        CE3DDFCFF9FD7EF7FC2E854D98D1A03792473E7115F1D6C9BBD39E8769A887C0
        0EACB85E2B7D6457753626A6E6D1DD6BF1D234DB4CF2274983D94D81096C25DE
        4DBC41248CDF515BB38DDAB72B17F92639FEE81B061BC745664E1ADA3B6EA1A5
        FD6678C4E238456A3F250D2C1B82093463659B8952FEB657EBB6E3A5E78BE199
        B2C2313404153F82C61FAD68A849C36D5B103C9D09557B1E4567CF183E6BEE61
        462D8E56A26D240D06A2C0297ADDD45BAF9519EA5FDF81042ED0DFDA062AE847
        53FB047EEAB723106690A2E0E3D83369D85FAEC41D471092DCEDC82FC94147E7
        109ABEEE81E58EEB3D02FF702D9822E099AE0FB25403763E320B7251589C895F
        BA87D0F8651F02A17F4F2C449AED7D4C89176ACB60CAD2C336E3018FC7C1A8D5
        8EBA83A7231EEFA2C8E3F58657C17A9DD6D2FA7E517A0ADF87496708E37E09B2
        8AF250529289DBA32E9C691B83395D8CDAFD5B110C453062B18361805CB30A42
        613CCE5F1C46FDD19699BBF76C558437B2BA946485FCA4502078D3985D898627
        9750A2F6C3E95D8687AF425E4531A472298241127B836058161A950401125FBD
        66C5AF7D6E5C3877052EB7AF6D76CE7E94E0ACABE08484F872B552F91B4F518E
        E550080A8504879FF06177961F14A952EDACF9BBCEEEF4E1C2652BBA07B9F0B0
        3AC80C5B4983255CFEF6ED2BB699D94F48C955E2DEB5E32624E7EC51E7D47011
        A141B30C169C73104944A82B5B02952843EFA800AC28153295113CD116503C01
        688A0BDBC835DC68FDF807BBC3D94038EEFFCE31C7A0D7D9F3AADE907198FB09
        86A6E19E772014F02229CD04A92615F11225D8782151C6AD0AA7FB5A307CE9D4
        47AE79F73B312F8841A7B5E63C7E288D07EEBA6167C857E2A66442906C8C79CB
        2CE73FC7F8F58E230B1EEF5731C17AAD66C05CF94A8180278E566B52205267C4
        040F9E398E89A1FEBD7E7FE0E798609D467DD15456572D162AA2C4FCEC127004
        E298E0FEE617E909ABA59865D99B31C15A8DBA25ADF0A9E79212A3B7CC371582
        239646E5E94818BF7F71C041E6B7828463B1C16A55B321B7FA50B23A2F0AC033
        9A112FD346E5438B4E5CFFEEE0D0B46D662709EFC504AB55CA7735E9252774E9
        15D1FB556A21D299A3D2BED931DC387D6C65869F26E17C4CB080CF3729E4B22E
        63C13E8334291514C3ACBE8B482590A617ADA7921B38DEF50DA6073A5A66ED8E
        9749261013BC12F378BC02854C764222D7EF492F7A161C86054B1A84C409909B
        2BEF9F6B3808D7682F66073BB134371E722F788E2CFA7CDFAFB4DA08FCC012E5
        B2A47AA140783CA3B43631812300939884842435E66E75C239DC4BE081C5F0F2
        72A7D7BB78D61F085C221AFBBA1562638B138B84A55289A44995515AEAF73911
        704D82A6E9916028746EC1E3391B89D0E3A4CEB976A59B013FB02DE4DC0F5314
        951C0E2FFF49FEB5DDFF7CFDE5FF13FD05C6A2C326827027C00000000049454E
        44AE426082}
    end
    object modifier: TVDTButton
      Left = 93
      Top = 30
      Width = 88
      Height = 25
      Action = actModifier
      Margin = 2
      Spacing = -1
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
        3B0000000473424954080808087C0864880000001974455874536F6674776172
        65007777772E696E6B73636170652E6F72679BEE3C1A0000053A4944415478DA
        7D940B4C536714C7FFB76FE88342AD20B4D84281C06038C29C738A63CEF908BA
        992D8BCE98851983191B4C677C2C3AE714A6D91871628C9BA83036A7998F8EC9
        D089F8C238110C88BC4A5B0A2D02954279556CEFEDBE76CC54444F72EE97FBDD
        EFFCCEB9E79CEF509844E62ECBA0C8B292E83CA27D44AFC68771F914C57CC230
        4CADC3E1C891CBE5293A9DEE2FAD564B4FC6A09E015E4C5154D9FCB9C9908885
        D0193A31D4ABA74D7DF4DF0A894B29110928BBDD5E2993C9988282822C62328D
        683CD136A2C6E781CB972D4A59B8ECEDE5B08FD2601E8DE2FA8593989DF206CE
        95FE81BAA676D81DEE860001DD6A1B76EFB3D79DFF217FDBB6C4CDB9B98E3B9D
        9DC904D1484D028D1109FD9AF2BED9413D1865C1ED0618C68DCBA54731551105
        91C81FC37D66C4BD988C5BD535283E72106B67A9F1D29448B4EA74587BFC782E
        C17C3519F840FA8AB48F67CE990F83A51BBD7D36EFBE9FC01FC14132B0D91CDC
        ADAE84429380419B159CD65DF8E0DD3771ECA7D3B856D281A29E9E4C86769DA0
        264003582CCA5C7C3057D43348C3E9A2211189BD510F8E8CC268E9828BEC79DE
        857C01CA0FBC87C2829D60DA8FA1BCAC0DE9C768C66A69CB26A8C289E00DAF26
        C7E76DFE6C1DFA479C3098BB60B30F7A4BC1E7F1A05628C0E170BDA9C9D9BC0A
        3F6E8C82E4E10DDCD3CB90B9AF1A6667845EDF50B591189CA57CA02C4F5573BE
        58A78E8E89034D8CDD04E8CD31798C38C6D0663263EC9113DADF8E22FBF57624
        6B28D8478428FAF50A8A9B62D1D3D3AB35B7D57D4E387A5F706A804474E964E1
        1E0C0C3B51DF6A24408680292843E4981228F53A292F2BC570433EB2D62C05D3
        5D868B17ACC8AF56A273800D8BA13E6BC06A39427023BEE082B405AF656665AC
        42A3C102D5B460B0392C6FE4A6AE5E743FE887C9A047E9A14C949E2E06EB6E26
        6A8D11D870D888D96FADC6B98A7FBAEBABB4AB08EAD2E33E1EBF69E66F777C1A
        9A98104B0AE5408BD102174D8345BE2843A640152AC7D2B4C5787F490212FCAF
        422C9163F5CE3A646FDD8BD28A6A34B6B69FA9BB76663BE1DCF305CF16FA0BAA
        B445DF8162B341920B16C9389BF5DF0F997BFAF0FB192D6E5C2E47E6F219DEFE
        BDDD6CC68A355B20910460D7FE93686FA9DD6A6AAE2E24C7ADBEE0BC05F3666E
        D8B6FE23349BBAD06B1B0087CD42747828E48112925B37E6A42E81685A0242D9
        0688E42A44C6C462DE2B491818A1B17DEFA1919BE5452B6997F31CC131BE60E3
        EE2D19AA97935E008FCB2191B2484B31D075DC87B57F10972F5E40E5A54AA42D
        4A457C5C1C424242A0542A21954AB1677F314E69CBAFDDAE38EEE986EAC74388
        4093F83C6ECD9F257970D20CEA75A6F1DC5250874D45D85419C6C6C660349970
        DF3604364F40FE8683587518A46440BDF3E126B434DEC96FA9A9D84778265FF0
        CEB9B3667C99B375DD53C3C848BAC142F24B261DB81C3662231410FBFB3DFEDE
        485A3263E31E77DDF5B3AB87FA7B4F91AD87BEE0BDC989B19BBEFF3A1BCF13CF
        556E349A3134EAC074D2D78A60190EFFA245E1CFA79B6F9E2FF64475E589794C
        C069A4385A6558302B292106D191E1888E0847842A94E49BFB5C67E9D9BB517B
        FB5649FD8DD21CF2DAFC04D8F3D024A6A40BC5410BF97EA2282E5FA061B1D812
        36E90A35E98AFF1D79568D5A01019FE735D4B79BBD60FDDDAAEC2E634309D9B2
        3D0526E299136AA28144A5B210D5F4A0E0E91AA12448C3F3134671798248E24C
        44261FC2C3421015A14443931E1D9D664F1AD6139BF3F076FFD3E089E2094B4A
        34607C95CA43235581C1E151FEE2400D5F20D4B85C8FAC1D2D3527C898BCEEA9
        E344C0B3C093097F8233F1F82DF3405D130FFF0BBECE2B5661BCB1F400000000
        49454E44AE426082}
    end
    object ajouter: TVDTButton
      Left = 5
      Top = 30
      Width = 88
      Height = 25
      Action = actAjouter
      Margin = 2
      Spacing = -1
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
        3B0000000473424954080808087C0864880000001974455874536F6674776172
        65007777772E696E6B73636170652E6F72679BEE3C1A000003B94944415478DA
        9D94794C134114C6DF6E6DBBF480825148D5CAD182460D6A88F102638C511382
        FA8FD110A3180944A3C8115434DE281E68BCE3418C88F148202287A0A21C225A
        0E4F2E058AB6A891E0016239DAAE6FDAB2AE15157CC9B7333BB3F3FB6676E60D
        05FD4460480485C532D42C541BAA18555872F34C170C30A83F80175014953B27
        30009CE55268D019E07593DE68ECEABE8BDD39A85C34D1FF0F382F647ED0BC90
        858BE1EB773330421A5C2414B4E875505256857A025F3B3A5FD84D88CAD0C8FC
        573042FD6452A7DAE47DDBA936A3002C16D62A330B580248191A14121A5A3FE8
        E1B1B6C26AF2A5FDDB275C613E0E3F8B06857F029F0C5B1ABC66CACC39D0D56B
        B14259849A8981158E266860C1468948001E0A1A3EBC6B861B39F7A154FBBCFB
        7D73F5F0C617A5ED9403D485A62943EAE9BDB2EF66860311B0C501CEAD023BE5
        CC10E8FEAC83B81DC77A4AB3CFCD6459B6DC111C332D607CF2C60D91D06E34DB
        20AC1DDC07E5D5FB8C460E15C1CDAC1C48B9945EA5BD931689A89F6084D25834
        2426447AF98D19C70D62ED70F27FB97A9F0131C5768D9281F0E8DD50A12D3B53
        FD38EF00729AF8E0D92ECEB27BD75392C0D86383B0ECAF70D60148EA22210502
        53072C09DF0235E5B757B7BDD75D455C271F7C2278EE8CB5EB2342A1D76483E0
        9303F789C611945D343E18110DD9F94570E864AABEECD6859588BAC79D0A7BA6
        190E6E5FA7F49F3096839010D04414D044FD9E7A209B0605F78B329E16676CC3
        D76A3E78BA54C294665E3C04944040A68A201BF05F81D908C1A1B1D058A3DDFC
        A6AE3C059B5AF9E0E4B9B3A6C46C8D5E4598B6A5FEFB3AB046312648C2DE539D
        8FF22E2E339B7A49165AF860DD9E4D119E41D3260D10F733928EA7427A665E49
        45C1955872CCB89446E864B14858999D960C62B1685050726A16AD8887FA9A27
        47EA2B0B8E62D31B3E7867E0D489DB1237470E7AB635AF74101197C43E7B7063
        79C7E78FE9D8D4C507EF0FF01F1B7F7857D4A0C1E72F6762B665D43DCA4F25B3
        2AE2F71170302E2973D408777AF2043FF0F55181AFB70ABC3D9578F8857F0587
        45ED81AA0A6DDAF3875989F85AF70B983CD4FE416152B9DB3CB1934C2314336A
        9A16380BF0007BA9949C1129D55E2381B1EF4363B3C10AC69B2CEA9DEE651A36
        7DFA0D8C41EE092F942B4A31D4C373B49BFB68B5D4D94D2D72926A8422C607CD
        64244954233C40E33D0A5ED636C25BBD81FC86681C43EE62B63FB06390692950
        2EF652314CE9E3E9EAAED248E4AE6A3123559B4C3DAD6FEB2BAFB5B6343C20FB
        E80818681E90103B98C9C19665046A72FCF807D249D126B1E3C7B40000000049
        454E44AE426082}
    end
    object Bevel7: TBevel
      Left = 272
      Top = 32
      Width = 6
      Height = 22
      Shape = bsLeftLine
    end
    object btAcheter: TVDTButton
      Left = 278
      Top = 31
      Width = 88
      Height = 25
      Action = actAcheter
      Margin = 2
      Spacing = -1
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
        3B0000000473424954080808087C0864880000001974455874536F6674776172
        65007777772E696E6B73636170652E6F72679BEE3C1A000003ED4944415478DA
        C5D57F4C94751C07F0F7733EBF0E9EFB010113307E2C822BC2C130E6BC1C752E
        9C13DAD14CB6636B11A39658B16CD6D6A6CBB0669B522C9A385B3F948A4DD4B4
        F40F2BD60A6BE2E1627920287A9C488770BF7F3C7A77CFB7EF41C22C21AAB59E
        7FBEBBDDF37DDDF37CDE9FEFE7184208FE8B8BF95F61867B88A18B40223FC8FF
        1AA698481713083117A484CD0C083F38C9BC8598ED5D42E4BFFC81DB608AA5D2
        A55205C5BC2ADB5F5165708B8FDDE78221358C488CC13B3D1968EE4EB7F9E4F0
        5628E74FD2BDCABC3058A386AECFE8F848CD9A3CEF0A8A319506175212A377DC
        30E6E5B1E5640EE9ECD71D0571BD4A621787E6835FAF2BB16F6BA91C834E5C7C
        90DD233A3C7F3C3774DEA96A8172651751A6FCB7C19A84B29ED6F5BDAB3CB280
        8AFC18EE4F8B2C1A8F97A7F5743A767C9B79D9277B9E8432FC232D4F6C1A4ED5
        960EEE59672D6068EE37A22A885C022CC58145E3214687A341336A9BAD5B11FB
        A59DC2BE5BA538BEC568AB2C4977CFDEFC2B23A2BE50869E9B1FF44B064C2E7F
        198E65B5B83470094F5759B623D6DF4A61CF2D7825CBC43A6BD65EC85A27CDE1
        6E4185921CC09830177CBC81FC9915701634C19F54024E4A42043C5CE357B161
        75F5356F38D40465E008C5A3719887F686138F0FE98BE52578161E68A23321C6
        8B25E464A23A790A1359168CE736806896416019708200B5568F51471FBAF7ED
        C4279F5F2197DD5C076217DE0002C371F841E4BACFE011C73496E4E5D028F961
        08CE8448541CD4E6C3D0B6EF05D7F40A34F7DE83048D8841C7D7E8FABE19C7D8
        3104590E779F2A85FD2BF708C8D51A288E7371580D2EEA816580C792992765C2
        2A547331984334C4EC35904AB741BBB11CD1FD1DE85D3A8A2F6C6DB0AAC31054
        09A8CDB3A0BE6813BADE3F85DD6FEE79098AED202526A74F1E3D719B911668C1
        C30E16D25CBB1505246CCAC845D4F436268EEDC037EC199C36B0C81032B0B9E8
        39D464552125391D118541E7A12FD158B7F32C88B391F675EFEC91A6F80AF091
        43583D968D6CDF2C9EE81310295223A20D61795219EAF31A604A5B098DC82359
        2F81E3780CDB47F1DA415A96B63EC0C55969804FFD71566869F4FB5138F504CA
        C601D5CC7792A0C7AE0D07F0809ED657E4A051F3481455181A19C2EECFDA71A2
        D3AAE03AFF1D88EF23288327E24D75C7E9C6B0C606DC157E0FA651DA3137F168
        FE46BC58BE1D9228406409FAFA7FC6DE03FBD0DFED0841568E805CFF008A9D3E
        2E7CE47770A1B15908367A585A1FCC3795AF456DF10BF8A9A7079F767C0CA7CD
        7B0D8CDC41D3FF1064CA4E8DD09FF62F34E829AE0651DA9616A7D4792E062107
        82E74002F47587BB809B1374EFBC836571FF20ACD10CE209D1563A4B3F7A169A
        C37F0BFE27D76F8C36C23A772A99260000000049454E44AE426082}
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 192
    Top = 40
    object ListeApercu: TAction
      Tag = 1
      Category = 'Liste'
      Caption = '   &Aper'#231'u avant impression'
      ImageIndex = 4
      OnExecute = ListeApercuExecute
    end
    object ListeImprime: TAction
      Tag = 2
      Category = 'Liste'
      Caption = '   &Imprimer'
      ImageIndex = 3
      OnExecute = ListeApercuExecute
    end
    object actAjouter: TAction
      Category = 'Achats'
      Caption = 'Nouveau'
      OnExecute = actAjouterExecute
    end
    object actModifier: TAction
      Category = 'Achats'
      Caption = 'Modifier'
      OnExecute = actModifierExecute
    end
    object actSupprimer: TAction
      Category = 'Achats'
      Caption = 'Supprimer'
      OnExecute = actSupprimerExecute
    end
    object actAcheter: TAction
      Category = 'Achats'
      Caption = 'Acheter'
      OnExecute = actAcheterExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 152
    Top = 40
    object Liste1: TMenuItem
      Caption = 'Liste'
      object Aperuavantimpression1: TMenuItem
        Action = ListeApercu
      end
      object Imprimer1: TMenuItem
        Action = ListeImprime
      end
    end
  end
end
