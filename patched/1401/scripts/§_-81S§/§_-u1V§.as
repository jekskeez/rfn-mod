package §_-81S§
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import events.§_-n13§;
   import protocol.§_-S2I§;
   import views.§_-F1z§;
   import views.§_-Z2N§;
   
   public class §_-u1V§ extends §_-33w§ implements §_-c11§
   {
      
      private var §_-6w§:§_-22V§ = null;
      
      private var emblem:§_-Z2N§ = null;
      
      private var photo:§_-F1z§ = null;
      
      private var §_-a1R§:int = -1;
      
      public function §_-u1V§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param4);
         this.clanId = param3;
      }
      
      public function get clanId() : int
      {
         return this.§_-a1R§;
      }
      
      public function set clanId(param1:int) : void
      {
         this.§_-a1R§ = param1;
      }
      
      override public function §_-027§() : void
      {
         if(this.photo != null)
         {
            return;
         }
         super.§_-027§();
         this.photo = new §_-F1z§("",0,0,80);
         addChild(this.photo);
         var _loc1_:§_-22V§ = new §_-22V§("",0,0,style);
         _loc1_.x = 85;
         _loc1_.y = 10;
         addChild(_loc1_);
         this.emblem = new §_-Z2N§("",90,33);
         addChild(this.emblem);
         this.§_-6w§ = new §_-22V§("",100,29,style);
         addChild(this.§_-6w§);
         switch(this.type)
         {
            case §_-S2I§.§_-11S§:
            case §_-S2I§.§_-Y1F§:
               _loc1_.htmlText = "<body>" + gls("Твоя заявка на вступление в клан") + "<body>";
               break;
            case §_-S2I§.§_-vV§:
            case §_-S2I§.§_-UB§:
               _loc1_.htmlText = "<body>" + gls("Клан") + "<body>";
               this.emblem.x = 122;
               this.emblem.y = 14;
               this.§_-6w§.x = 85;
               this.§_-6w§.y = 10;
               break;
            case §_-S2I§.§_-z1J§:
               _loc1_.htmlText = "<body>" + gls("В клане") + "<body>";
               this.emblem.visible = false;
               this.§_-6w§.x = 85;
               this.§_-6w§.y = 10;
         }
         §_-e2W§.listen(this.§_-r1P§);
         §_-e2W§.request(this.clanId,§_-Oy§.ALL);
      }
      
      private function §_-r1P§(param1:§_-n13§) : void
      {
         var _loc3_:String = null;
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         §_-e2W§.forget(this.§_-r1P§);
         this.photo.load(_loc2_.§_-cy§);
         this.emblem.load(_loc2_.§_-M24§);
         switch(this.type)
         {
            case §_-S2I§.§_-vV§:
               this.§_-6w§.htmlText = gls("<body><textformat leading=\'4\'>              {0}<br/>заблокирован за неуплату.</textformat><body>",_loc2_.name);
               break;
            case §_-S2I§.§_-UB§:
               this.§_-6w§.htmlText = gls("<body><textformat leading=\'4\'>              {0}<br/>удален.</textformat><body>",_loc2_.name);
               break;
            case §_-S2I§.§_-Y1F§:
               this.§_-6w§.htmlText = gls("<body>{0} отклонена.<body>",_loc2_.name);
               break;
            case §_-S2I§.§_-11S§:
               this.§_-6w§.htmlText = gls("<body>{0} одобрена.<body>",_loc2_.name);
               break;
            case §_-S2I§.§_-z1J§:
               this.§_-6w§.width = 350;
               this.§_-6w§.multiline = true;
               this.§_-6w§.wordWrap = true;
               this.§_-6w§.mouseEnabled = false;
               _loc3_ = §_-e2W§.§_-Rg§ == null ? "" : §_-e2W§.§_-Rg§.slice().replace(/\r/g," ");
               if(_loc3_.length > 100)
               {
                  _loc3_ = _loc3_.substr(0,100).concat("...");
               }
               this.§_-6w§.htmlText = gls("<body>               изменилась новость дня:<span class=\'blackSmall\'><br/>{0}</span><body>",_loc3_);
         }
      }
   }
}

