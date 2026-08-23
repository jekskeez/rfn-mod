package §_-l26§
{
   import §_-p1f§.§_-6Y§;
   import flash.utils.Endian;
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   
   public dynamic class §_-i1a§ implements §_-s18§
   {
      
      public static const §_-93V§:int = 0;
      
      private static var position:int = 0;
      
      public static const §_-A2U§:int = ++position;
      
      public static const §_-D1S§:int = ++position;
      
      public static const §_-22B§:int = ++position;
      
      public static const §_-12x§:int = ++position;
      
      public static const §_-O1x§:int = ++position;
      
      public static const §_-H1f§:int = ++position;
      
      public static const §_-31G§:int = ++position;
      
      public static const §_-R24§:int = ++position;
      
      public static const §_-u1X§:int = ++position;
      
      public static const §_-n18§:int = ++position;
      
      public static const §_-51Z§:int = ++position;
      
      public static const §_-Qx§:int = ++position;
      
      public static const §_-v1K§:int = ++position;
      
      public static const §_-Yq§:int = ++position;
      
      public static const §_-u5§:int = ++position;
      
      public static const §_-S2a§:int = ++position;
      
      public static const §_-d23§:int = ++position;
      
      public static const §_-cK§:int = ++position;
      
      public static const §_-s1t§:int = ++position;
      
      public static const §_-Y2v§:int = ++position;
      
      public static const §_-X2i§:int = ++position;
      
      public static const §_-N1C§:int = ++position;
      
      public static const §_-Z6§:int = ++position;
      
      public static const §_-G2e§:int = ++position;
      
      public static const §_-bl§:int = ++position;
      
      public static const §_-mT§:int = ++position;
      
      public static const §_-A1G§:int = ++position;
      
      public static const §_-E2V§:int = ++position;
      
      public static const §_-31H§:int = ++position;
      
      public static const §_-R1R§:int = ++position;
      
      public static const §_-Q1F§:int = ++position;
      
      public static const §_-Ki§:int = ++position;
      
      public static const §_-622§:int = ++position;
      
      public static const §_-A2X§:int = ++position;
      
      public static const §_-vc§:int = ++position;
      
      public static const §_-Y1Y§:int = ++position;
      
      public static const §_-kq§:int = ++position;
      
      public static const §_-T2T§:int = ++position;
      
      public static const §_-33p§:int = ++position;
      
      public static const §_-s9§:int = ++position;
      
      public static const §_-E2x§:int = ++position;
      
      public static const §_-43E§:int = ++position;
      
      public static const §_-H2R§:int = ++position;
      
      public static const §_-qL§:int = ++position;
      
      public static const §_-4v§:int = ++position;
      
      public static const §_-V2c§:int = ++position;
      
      public static const §_-K2U§:int = ++position;
      
      public static const §_-Wj§:int = ++position;
      
      public static const §_-c2N§:int = ++position;
      
      public static const §_-R1v§:int = ++position;
      
      public static const §_-Vc§:int = ++position;
      
      private var §_-B2q§:Object = {};
      
      public var uid:int = 0;
      
      public var nid:String = "";
      
      public var playerName:String = "";
      
      private var §_-H1n§:String = "";
      
      public var §_-MN§:String = "";
      
      public function §_-i1a§()
      {
         super();
      }
      
      public static function §_-82d§(param1:§_-S2I§) : §_-i1a§
      {
         var _loc2_:§_-i1a§ = new §_-i1a§();
         _loc2_.uid = param1[§_-22B§];
         _loc2_.nid = param1[§_-D1S§];
         _loc2_.playerName = param1[§_-12x§];
         _loc2_.§_-H1n§ = param1[§_-O1x§];
         _loc2_.§_-MN§ = param1[§_-H1f§];
         _loc2_.§_-Ob§(§_-6Y§.§_-a2u§,[param1[§_-12x§],param1[§_-O1x§],param1[§_-H1f§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-113§,[param1[§_-31G§],param1[§_-R24§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-wG§,[param1[§_-u1X§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-61Q§,[param1[§_-n18§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-a1H§,[param1[§_-51Z§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-P13§,[param1[§_-Qx§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-k2y§,[param1[§_-v1K§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-l2Y§,[param1[§_-Yq§],param1[§_-u5§],param1[§_-S2a§],param1[§_-d23§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-L27§,param1[§_-cK§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-Jy§,param1[§_-s1t§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-N29§,[param1[§_-Y2v§],param1[§_-X2i§],param1[§_-N1C§],param1[§_-Z6§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-O2P§,param1[§_-G2e§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-j2r§,param1[§_-bl§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-Z2u§,param1[§_-mT§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-x2g§,param1[§_-A1G§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-U5§,param1[§_-E2V§]);
         _loc2_.§_-Ob§(§_-6Y§.EXCHANGE,param1[§_-31H§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-3C§,param1[§_-R1R§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-N2n§,param1[§_-Q1F§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-TZ§,[param1[§_-Ki§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-33V§,param1[§_-622§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-U2X§,param1[§_-A2X§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-S2i§,[param1[§_-vc§],param1[§_-Y1Y§],param1[§_-kq§],param1[§_-T2T§],param1[§_-33p§],param1[§_-s9§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-U1l§,param1[§_-E2x§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-43h§,param1[§_-43E§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-329§,[param1[§_-H2R§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-w2A§,param1[§_-qL§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-Ee§,param1[§_-4v§]);
         _loc2_.§_-Ob§(§_-6Y§.§_-aS§,[param1[§_-V2c§],param1[§_-K2U§],param1[§_-Wj§],param1[§_-c2N§],param1[§_-R1v§]]);
         _loc2_.§_-Ob§(§_-6Y§.§_-2b§,param1[§_-Vc§]);
         return _loc2_;
      }
      
      public function get entityId() : int
      {
         return this.uid;
      }
      
      public function get entityName() : String
      {
         return this.playerName;
      }
      
      public function set entityName(param1:String) : void
      {
         this.playerName = param1;
      }
      
      public function get photoURL() : String
      {
         return this.§_-H1n§;
      }
      
      public function set photoURL(param1:String) : void
      {
         this.§_-H1n§ = param1;
      }
      
      public function get isClan() : Boolean
      {
         return false;
      }
      
      public function get formNames() : Array
      {
         return §_-6Y§.§_-ZC§;
      }
      
      public function §_-yN§() : Array
      {
         return [§_-6Y§.§_-a2u§];
      }
      
      public function §_-IO§(param1:int) : *
      {
         return §_-6Y§.§_-Q2Y§(param1);
      }
      
      public function §_-mi§(param1:int) : *
      {
         return param1 in this.§_-B2q§ ? this.§_-B2q§[param1] : null;
      }
      
      public function §_-Ob§(param1:int, param2:*) : void
      {
         this.§_-B2q§[param1] = param2;
      }
      
      public function §_-Ux§() : §_-U1M§
      {
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-4E§(this.playerName);
         _loc1_.§_-4E§(this.§_-H1n§);
         return _loc1_;
      }
   }
}

