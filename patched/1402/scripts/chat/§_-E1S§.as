package chat
{
   import §_-U19§.§_-B2U§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import events.ClanNoticeEvent;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-E1S§ extends §_-N2t§
   {
      
      private static const §_-f1j§:int = 100;
      
      private static const §_-Z1d§:int = 50;
      
      private static const §_-aD§:String = [".playerName {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}",".leaderName {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #FF0000;","font-weight: bold;","}",".subLeaderName {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #2E8A22;","font-weight: bold;","}",".message {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","}","a {","text-decoration: underline;","}","","a:hover {","text-decoration: none;","}"].join("\n");
      
      protected var style:StyleSheet = new StyleSheet();
      
      protected var text:TextField = new TextField();
      
      protected var §_-6z§:int = 250;
      
      protected var §_-U2P§:Vector.<§_-i5§> = new Vector.<§_-i5§>();
      
      public function §_-E1S§()
      {
         super();
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
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
         this.§_-93U§();
      }
      
      override public function §_-9x§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.§_-U2P§.length);
         while(_loc1_ < _loc2_)
         {
            removeChild(this.§_-U2P§[_loc1_]);
            this.§_-U2P§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
            this.§_-U2P§[_loc1_] = null;
            _loc1_++;
         }
         this.§_-U2P§ = new Vector.<§_-i5§>();
      }
      
      override public function sendMessage(param1:String) : void
      {
         super.sendMessage(param1);
         Connection.§_-e2T§(§_-u1O§.§_-Nb§,§_-u1O§.§_-Kr§,param1);
      }
      
      override public function §_-pH§(param1:int) : void
      {
         if(this.§_-6z§ == param1)
         {
            return;
         }
         super.§_-pH§(param1);
         this.§_-6z§ = param1;
         this.text.width = param1;
         this.§_-9x§();
         this.§_-DY§();
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§_-U2P§.length);
         while(_loc2_ < _loc3_)
         {
            this.§_-U2P§[_loc2_].width = param1;
            _loc2_++;
         }
      }
      
      override protected function §_-f9§(param1:§_-e28§) : void
      {
         this.§_-K1D§(param1);
         this.§_-c28§(§_-f1j§,§_-Z1d§);
         super.§_-f9§(param1);
      }
      
      protected function listen() : void
      {
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-Nb§,§_-s2l§.§_-q1d§]);
      }
      
      protected function §_-K1D§(param1:§_-e28§) : void
      {
         var _loc2_:§_-i5§ = new §_-i5§("",0,0,this.style);
         _loc2_.htmlText = "<textformat leading=\"0\">" + param1.text + "</textformat>";
         _loc2_.width = this.§_-6z§;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.embedFonts = true;
         _loc2_.userData = param1.userId;
         _loc2_.antiAliasType = AntiAliasType.ADVANCED;
         _loc2_.gridFitType = GridFitType.PIXEL;
         _loc2_.thickness = 100;
         _loc2_.sharpness = 0;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
         _loc2_.y = this.§_-U2P§.length ? this.§_-U2P§[this.§_-U2P§.length - 1].y + this.§_-U2P§[this.§_-U2P§.length - 1].height : 0;
         addChild(_loc2_);
         this.§_-U2P§.push(_loc2_);
      }
      
      protected function §_-93U§() : void
      {
         §_-B2U§.listen(this.§_-S1r§,ClanNoticeEvent.CLAN_NEWS_CHANGED);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-Nb§:
               if(param1[0] != §_-u1O§.§_-Kr§)
               {
                  return;
               }
               if(§_-u1T§.§_-P1f§(param1[1]))
               {
                  return;
               }
               §_-GH§(new §_-S24§(Game.getPlayer(param1[1]),param1[2]));
               if(param1[1] != Game.self.id && !(§_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-H1k§))
               {
                  GameSounds.play("message_recieve");
               }
               break;
            case §_-s2l§.§_-q1d§:
               if(param1[0] != §_-u1O§.§_-Kr§)
               {
                  return;
               }
               this.§_-B2s§(param1[1]);
         }
      }
      
      private function §_-B2s§(param1:Array) : void
      {
         this.§_-9x§();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            §_-GH§(new §_-S24§(Game.getPlayer(param1[_loc2_]),param1[_loc2_ + 1]));
            _loc2_ += 2;
         }
      }
      
      private function §_-DY§() : void
      {
         var _loc1_:§_-e28§ = null;
         this.§_-9x§();
         for each(_loc1_ in this.§_-Z0§)
         {
            this.§_-K1D§(_loc1_);
         }
      }
      
      private function §_-S1r§(param1:ClanNoticeEvent) : void
      {
         §_-GH§(new §_-mZ§(§_-mZ§.§_-W1p§));
      }
      
      private function §_-QQ§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = §_-i5§(param1.currentTarget);
         if(_loc2_.userData)
         {
            §_-cD§.§_-e25§(int(_loc2_.userData));
         }
      }
      
      private function §_-c28§(param1:int, param2:int) : void
      {
         if(this.§_-Z0§.length <= param1)
         {
            return;
         }
         this.§_-9x§();
         this.§_-Z0§ = this.§_-Z0§.slice(param2);
         this.§_-U2P§ = this.§_-U2P§.slice(param2);
         this.§_-DY§();
      }
   }
}

