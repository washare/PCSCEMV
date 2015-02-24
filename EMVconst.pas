unit EMVconst;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.AnsiStrings,
  Generics.Collections;

type
  TEMVTag = packed record
    Tag: AnsiString;
    Name: string;

    procedure Clear;
  end;

function GetEMVTag(Tag: AnsiString): TEMVTag;

var
  EMVTags: TList<TEMVTag>;

implementation

function EMVTag(Tag: AnsiString; Name: string): TEMVTag;
begin
  Result.Tag := Tag;
  Result.Name := Name;
end;

function GetEMVTag(Tag: AnsiString): TEMVTag;
var
  i: Integer;
begin
  Result.Clear;
  for i := 0 to EMVTags.Count - 1 do
    if EMVTags[i].Tag = Tag then
    begin
      Result := EMVTags[i];
      break;
    end;
end;

{ TEMVTag }

procedure TEMVTag.Clear;
begin
  Tag := '';
  Name := '';
end;

initialization
begin
  EMVTags := TList<TEMVTag>.Create;

  // All Data Elements by Tags used in TLV structure (according to the EMV 4.2 Standard )
  // Thanks to http://dexterous-programmer.blogspot.in/2012/05/emv-tags.html )))
  EMVTags.Add(EMVTag(#$42,	'Issuer Identification Number (IIN)'));
  EMVTags.Add(EMVTag(#$4F,	'Application Identifier (AID) - card'));
  EMVTags.Add(EMVTag(#$50,	'Application Label'));
  EMVTags.Add(EMVTag(#$57,	'Track 2 Equivalent Data'));
  EMVTags.Add(EMVTag(#$5A,	'Application Primary Account Number (PAN)'));
  EMVTags.Add(EMVTag(#$5F#$20,	'Cardholder Name'));
  EMVTags.Add(EMVTag(#$5F#$24,	'Application Expiration Date'));
  EMVTags.Add(EMVTag(#$5F#$25,	'Application Effective Date'));
  EMVTags.Add(EMVTag(#$5F#$28,	'Issuer Country Code'));
  EMVTags.Add(EMVTag(#$5F#$2A,	'Transaction Currency Code'));
  EMVTags.Add(EMVTag(#$5F#$2D,	'Language Preference'));
  EMVTags.Add(EMVTag(#$5F#$30,	'Service Code'));
  EMVTags.Add(EMVTag(#$5F#$34,	'Application Primary Account Number (PAN) Sequence Number'));
  EMVTags.Add(EMVTag(#$5F#$36,	'Transaction Currency Exponent'));
  EMVTags.Add(EMVTag(#$5F#$50,	'Issuer URL'));
  EMVTags.Add(EMVTag(#$5F#$53,	'International Bank Account Number (IBAN)'));
  EMVTags.Add(EMVTag(#$5F#$54,	'Bank Identifier Code (BIC)'));
  EMVTags.Add(EMVTag(#$5F#$55,	'Issuer Country Code (alpha2 format)'));
  EMVTags.Add(EMVTag(#$5F#$56,	'Issuer Country Code (alpha3 format)'));
  EMVTags.Add(EMVTag(#$61,	'Application Template'));
  EMVTags.Add(EMVTag(#$6F,	'File Control Information (FCI) Template'));
  EMVTags.Add(EMVTag(#$70,	'READ RECORD Response Message Template'));
  EMVTags.Add(EMVTag(#$71,	'Issuer Script Template 1'));
  EMVTags.Add(EMVTag(#$72,	'Issuer Script Template 2'));
  EMVTags.Add(EMVTag(#$73,	'Directory Discretionary Template'));
  EMVTags.Add(EMVTag(#$77,	'Response Message Template Format 2'));
  EMVTags.Add(EMVTag(#$80,	'Response Message Template Format 1'));
  EMVTags.Add(EMVTag(#$81,	'Amount, Authorised (Binary)'));
  EMVTags.Add(EMVTag(#$82,	'Application Interchange Profile'));
  EMVTags.Add(EMVTag(#$83,	'Command Template'));
  EMVTags.Add(EMVTag(#$84,	'Dedicated File (DF) Name'));
  EMVTags.Add(EMVTag(#$86,	'Issuer Script Command'));
  EMVTags.Add(EMVTag(#$87,	'Application Priority Indicator'));
  EMVTags.Add(EMVTag(#$88,	'Short File Identifier (SFI)'));
  EMVTags.Add(EMVTag(#$89,	'Authorisation Code'));
  EMVTags.Add(EMVTag(#$8A,	'Authorisation Response Code'));
  EMVTags.Add(EMVTag(#$8C,	'Card Risk Management Data Object List 1 (CDOL1)'));
  EMVTags.Add(EMVTag(#$8D,	'Card Risk Management Data Object List 2 (CDOL2)'));
  EMVTags.Add(EMVTag(#$8E,	'Cardholder Verification Method (CVM) List'));
  EMVTags.Add(EMVTag(#$8F,	'Certification Authority Public Key Index'));
  EMVTags.Add(EMVTag(#$90,	'Issuer Public Key Certificate'));
  EMVTags.Add(EMVTag(#$91,	'Issuer Authentication Data'));
  EMVTags.Add(EMVTag(#$92,	'Issuer Public Key Remainder'));
  EMVTags.Add(EMVTag(#$93,	'Signed Static Application Data'));
  EMVTags.Add(EMVTag(#$94,	'Application File Locator (AFL)'));
  EMVTags.Add(EMVTag(#$95,	'Terminal Verification Results'));
  EMVTags.Add(EMVTag(#$97,	'Transaction Certificate Data Object List (TDOL)'));
  EMVTags.Add(EMVTag(#$98,	'Transaction Certificate (TC) Hash Value'));
  EMVTags.Add(EMVTag(#$99,	'Transaction Personal Identification Number (PIN) Data'));
  EMVTags.Add(EMVTag(#$9A,	'Transaction Date'));
  EMVTags.Add(EMVTag(#$9B,	'Transaction Status Information'));
  EMVTags.Add(EMVTag(#$9C,	'Transaction Type'));
  EMVTags.Add(EMVTag(#$9D,	'Directory Definition File (DDF) Name'));
  EMVTags.Add(EMVTag(#$9F#$01,	'Acquirer Identifier'));
  EMVTags.Add(EMVTag(#$9F#$02,	'Amount, Authorised (Numeric)'));
  EMVTags.Add(EMVTag(#$9F#$03,	'Amount, Other (Numeric)'));
  EMVTags.Add(EMVTag(#$9F#$04,	'Amount, Other (Binary)'));
  EMVTags.Add(EMVTag(#$9F#$05,	'Application Discretionary Data'));
  EMVTags.Add(EMVTag(#$9F#$06,	'Application Identifier (AID) - terminal'));
  EMVTags.Add(EMVTag(#$9F#$07,	'Application Usage Control'));
  EMVTags.Add(EMVTag(#$9F#$08,	'Application Version Number'));
  EMVTags.Add(EMVTag(#$9F#$09,	'Application Version Number'));
  EMVTags.Add(EMVTag(#$9F#$0B,	'Cardholder Name Extended'));
  EMVTags.Add(EMVTag(#$9F#$0D,	'Issuer Action Code - Default'));
  EMVTags.Add(EMVTag(#$9F#$0E,	'Issuer Action Code - Denial'));
  EMVTags.Add(EMVTag(#$9F#$0F,	'Issuer Action Code - Online'));
  EMVTags.Add(EMVTag(#$9F#$10,	'Issuer Application Data'));
  EMVTags.Add(EMVTag(#$9F#$11,	'Issuer Code Table Index'));
  EMVTags.Add(EMVTag(#$9F#$12,	'Application Preferred Name'));
  EMVTags.Add(EMVTag(#$9F#$13,	'Last Online Application Transaction Counter (ATC) Register'));
  EMVTags.Add(EMVTag(#$9F#$14,	'Lower Consecutive Offline Limit'));
  EMVTags.Add(EMVTag(#$9F#$15,	'Merchant Category Code'));
  EMVTags.Add(EMVTag(#$9F#$16,	'Merchant Identifier'));
  EMVTags.Add(EMVTag(#$9F#$17,	'Personal Identification Number (PIN) Try Counter'));
  EMVTags.Add(EMVTag(#$9F#$18,	'Issuer Script Identifier'));
  EMVTags.Add(EMVTag(#$9F#$1A,	'Terminal Country Code'));
  EMVTags.Add(EMVTag(#$9F#$1B,	'Terminal Floor Limit'));
  EMVTags.Add(EMVTag(#$9F#$1C,	'Terminal Identification'));
  EMVTags.Add(EMVTag(#$9F#$1D,	'Terminal Risk Management Data'));
  EMVTags.Add(EMVTag(#$9F#$1E,	'Interface Device (IFD) Serial Number'));
  EMVTags.Add(EMVTag(#$9F#$1F,	'Track 1 Discretionary Data'));
  EMVTags.Add(EMVTag(#$9F#$20,	'Track 2 Discretionary Data'));
  EMVTags.Add(EMVTag(#$9F#$21,	'Transaction Time'));
  EMVTags.Add(EMVTag(#$9F#$22,	'Certification Authority Public Key Index'));
  EMVTags.Add(EMVTag(#$9F#$23,	'Upper Consecutive Offline Limit'));
  EMVTags.Add(EMVTag(#$9F#$26,	'Application Cryptogram'));
  EMVTags.Add(EMVTag(#$9F#$27,	'Cryptogram Information Data'));
  EMVTags.Add(EMVTag(#$9F#$2D,	'ICC PIN Encipherment Public Key Certificate'));
  EMVTags.Add(EMVTag(#$9F#$2E,	'ICC PIN Encipherment Public Key Exponent'));
  EMVTags.Add(EMVTag(#$9F#$2F,	'ICC PIN Encipherment Public Key Remainder'));
  EMVTags.Add(EMVTag(#$9F#$32,	'Issuer Public Key Exponent'));
  EMVTags.Add(EMVTag(#$9F#$33,	'Terminal Capabilities'));
  EMVTags.Add(EMVTag(#$9F#$34,	'Cardholder Verification Method (CVM) Results'));
  EMVTags.Add(EMVTag(#$9F#$35,	'Terminal Type'));
  EMVTags.Add(EMVTag(#$9F#$36,	'Application Transaction Counter (ATC)'));
  EMVTags.Add(EMVTag(#$9F#$37,	'Unpredictable Number'));
  EMVTags.Add(EMVTag(#$9F#$38,	'Processing Options Data Object List (PDOL)'));
  EMVTags.Add(EMVTag(#$9F#$39,	'Point-of-Service (POS) Entry Mode'));
  EMVTags.Add(EMVTag(#$9F#$3A,	'Amount, Reference Currency'));
  EMVTags.Add(EMVTag(#$9F#$3B,	'Application Reference Currency'));
  EMVTags.Add(EMVTag(#$9F#$3C,	'Transaction Reference Currency Code'));
  EMVTags.Add(EMVTag(#$9F#$3D,	'Transaction Reference Currency Exponent'));
  EMVTags.Add(EMVTag(#$9F#$40,	'Additional Terminal Capabilities'));
  EMVTags.Add(EMVTag(#$9F#$41,	'Transaction Sequence Counter'));
  EMVTags.Add(EMVTag(#$9F#$42,	'Application Currency Code'));
  EMVTags.Add(EMVTag(#$9F#$43,	'Application Reference Currency Exponent'));
  EMVTags.Add(EMVTag(#$9F#$44,	'Application Currency Exponent'));
  EMVTags.Add(EMVTag(#$9F#$45,	'Data Authentication Code'));
  EMVTags.Add(EMVTag(#$9F#$46,	'ICC Public Key Certificate'));
  EMVTags.Add(EMVTag(#$9F#$47,	'ICC Public Key Exponent'));
  EMVTags.Add(EMVTag(#$9F#$48,	'ICC Public Key Remainder'));
  EMVTags.Add(EMVTag(#$9F#$49,	'Dynamic Data Authentication Data Object List (DDOL)'));
  EMVTags.Add(EMVTag(#$9F#$4A,	'Static Data Authentication Tag List'));
  EMVTags.Add(EMVTag(#$9F#$4B,	'Signed Dynamic Application Data'));
  EMVTags.Add(EMVTag(#$9F#$4C,	'ICC Dynamic Number'));
  EMVTags.Add(EMVTag(#$9F#$4D,	'Log Entry'));
  EMVTags.Add(EMVTag(#$9F#$4E,	'Merchant Name and Location'));
  EMVTags.Add(EMVTag(#$9F#$4F,	'Log Format'));
  EMVTags.Add(EMVTag(#$A5,	'File Control Information (FCI) Proprietary Template'));
  EMVTags.Add(EMVTag(#$BF#$0C,	'File Control Information (FCI) Issuer Discretionary Data'));
end;

end.