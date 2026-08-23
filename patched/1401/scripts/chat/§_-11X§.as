package chat
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-P1Y§;
   import §_-dc§.§_-e2W§;
   import events.ClanNoticeEvent;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-11X§ extends §_-AQ§
   {
      
      private static const §_-e2Z§:int = 100;
      
      private static const §_-G1R§:int = 50;
      
      private static const §_-I2U§:String = [".playerName {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".leaderName {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #FF0000;","font-weight: bold;","}",".subLeaderName {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #2E8A22;","font-weight: bold;","}",".message {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","}","a {","text-decoration: underline;","}","","a:hover {","text-decoration: none;","}"].join("\n");
      
      protected var style:StyleSheet = new StyleSheet();
      
      protected var text:TextField = new TextField();
      
      protected var §_-2f§:int = 250;
      
      protected var §_-oq§:Vector.<§_-22V§> = new Vector.<§_-22V§>();
      
      public function §_-11X§()
      {
         super();
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.text.text = "";
         this.text.width = 100;
         this.text.height = 100;
         this.text.multiline = true;
         this.text.wordWrap = true;
         this.text.embedFonts = true;
         this.text.antiAliasType = AntiAliasType.ADVANCED;
         this.text.gridFitType = GridFitType.PIXEL;
         this.text.thickness = 100;
         this.text.sharpness = 0;
         addChild(this.text);
         this.listen();
         this.§_-62Y§();
      }
      
      override public function §_-D1L§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.§_-oq§.length);
         while(_loc1_ < _loc2_)
         {
            removeChild(this.§_-oq§[_loc1_]);
            this.§_-oq§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
            this.§_-oq§[_loc1_] = null;
            _loc1_++;
         }
         this.§_-oq§ = new Vector.<§_-22V§>();
      }
      
      override public function sendMessage(param1:String) : void
      {
         super.sendMessage(param1);
         Connection.§_-Li§(§_-h2B§.§_-aR§,§_-h2B§.§_-v2O§,param1);
      }
      
      override public function §_-7M§(param1:int) : void
      {
         if(this.§_-2f§ == param1)
         {
            return;
         }
         super.§_-7M§(param1);
         this.§_-2f§ = param1;
         this.text.width = param1;
         this.§_-D1L§();
         this.§_-ze§();
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§_-oq§.length);
         while(_loc2_ < _loc3_)
         {
            this.§_-oq§[_loc2_].width = param1;
            _loc2_++;
         }
      }
      
      override protected function §_-Mw§(param1:§_-dd§) : void
      {
         this.§_-l1i§(param1);
         this.§_-l15§(§_-e2Z§,§_-G1R§);
         super.§_-Mw§(param1);
      }
      
      protected function listen() : void
      {
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-aR§,§_-S2I§.§_-b19§]);
      }
      
      protected function §_-l1i§(param1:§_-dd§) : void
      {
         var _loc2_:§_-22V§ = new §_-22V§("",0,0,this.style);
         _loc2_.htmlText = "<textformat leading=\"0\">" + param1.text + "</textformat>";
         _loc2_.width = this.§_-2f§;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.embedFonts = true;
         _loc2_.userData = param1.userId;
         _loc2_.antiAliasType = AntiAliasType.ADVANCED;
         _loc2_.gridFitType = GridFitType.PIXEL;
         _loc2_.thickness = 100;
         _loc2_.sharpness = 0;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
         _loc2_.y = this.§_-oq§.length ? this.§_-oq§[this.§_-oq§.length - 1].y + this.§_-oq§[this.§_-oq§.length - 1].height : 0;
         addChild(_loc2_);
         this.§_-oq§.push(_loc2_);
      }
      
      protected function §_-62Y§() : void
      {
         §_-e2W§.listen(this.§_-Cf§,ClanNoticeEvent.CLAN_NEWS_CHANGED);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-aR§:
               if(param1[0] != §_-h2B§.§_-v2O§)
               {
                  return;
               }
               if(§_-IP§.§_-r1m§(param1[1]))
               {
                  return;
               }
               §_-72y§(new §_-ao§(Game.getPlayer(param1[1]),param1[2]));
               if(param1[1] != Game.self.id && !(§_-71o§.active is §_-92z§ || §_-71o§.active is §_-P1Y§))
               {
                  GameSounds.play("message_recieve");
               }
               break;
            case §_-S2I§.§_-b19§:
               if(param1[0] != §_-h2B§.§_-v2O§)
               {
                  return;
               }
               this.§_-A3Q§(param1[1]);
         }
      }
      
      private function §_-A3Q§(param1:Array) : void
      {
         this.§_-D1L§();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            §_-72y§(new §_-ao§(Game.getPlayer(param1[_loc2_]),param1[_loc2_ + 1]));
            _loc2_ += 2;
         }
      }
      
      private function §_-ze§() : void
      {
         var _loc1_:§_-dd§ = null;
         this.§_-D1L§();
         for each(_loc1_ in this.§_-03P§)
         {
            this.§_-l1i§(_loc1_);
         }
      }
      
      private function §_-Cf§(param1:ClanNoticeEvent) : void
      {
         §_-72y§(new §_-r1K§(§_-r1K§.§_-k1a§));
      }
      
      private function §_-o1P§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = §_-22V§(param1.currentTarget);
         if(_loc2_.userData)
         {
            §_-927§.§_-i2I§(int(_loc2_.userData));
         }
      }
      
      private function §_-l15§(param1:int, param2:int) : void
      {
         if(this.§_-03P§.length <= param1)
         {
            return;
         }
         this.§_-D1L§();
         this.§_-03P§ = this.§_-03P§.slice(param2);
         this.§_-oq§ = this.§_-oq§.slice(param2);
         this.§_-ze§();
      }
   }
}

