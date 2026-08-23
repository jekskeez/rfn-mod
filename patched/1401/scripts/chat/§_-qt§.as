package chat
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-P1Y§;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   
   public class §_-qt§ extends §_-AQ§
   {
      
      private static const §_-O2I§:int = 235;
      
      private static const §_-G1R§:int = 50;
      
      private static const §_-41G§:int = 5000;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #C9FFFF;","text-align: left;","}",".justify {","text-align: justify;","}",".name {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".service_message {","color: #F7CF81;","}",".vip_message {","color: #FEFE00;","}",".name_shaman {","color: #A6DAF7;","font-weight: bold;","}",".name_leader {","color: #FF0000;","font-weight: bold;","}",".name_moderator {","color: #7CF772;","font-weight: bold;","}",".color0 {","color: #FFFFFF;","font-weight: bold;","}",".color1 {","color: #FF5A3A;","font-weight: bold;","}",".color2 {","color: #FFA800;","font-weight: bold;","}",".color3 {","color: #FFF12A;","font-weight: bold;","}",".color4 {","color: #FFC8FF;","font-weight: bold;","}",".color5 {","color: #66F2FF;","font-weight: bold;","}",".color6 {","color: #66A6FF;","font-weight: bold;","}",".color7 {","color: #EF66FF;","font-weight: bold;"
      ,"}"].join("\n");
      
      public var type:int;
      
      public var §_-X2q§:Boolean = false;
      
      private var style:StyleSheet = null;
      
      private var §_-Wa§:Array = [];
      
      public function §_-qt§(param1:int)
      {
         super();
         this.type = param1;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-aR§]);
      }
      
      override public function §_-D1L§() : void
      {
         var _loc1_:* = int(this.§_-Wa§.length - 1);
         while(_loc1_ >= 0)
         {
            removeChild(this.§_-Wa§[_loc1_]);
            this.§_-Wa§[_loc1_].removeEventListener(MouseEvent.MOUSE_UP,this.§_-o1P§);
            _loc1_--;
         }
         this.§_-Wa§.splice(0);
      }
      
      public function §_-A3Q§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            §_-72y§(new §_-n1V§(Game.getPlayer(param1[_loc2_]),param1[_loc2_ + 1]));
            _loc2_ += 2;
         }
         §_-72y§(new §_-n1V§(null,gls("<span class=\'justify\'>Добро пожаловать в чат. Пожалуйста, соблюдай <a href=\'{0}\' target=\'_blank\'>правила</a>.\nЗнакомьcя, общайся, приглашай друзей.</span>",§_-a9§.§_-v1U§[§_-a9§.§_-L2p§].rules)));
      }
      
      public function flush() : void
      {
         dispose();
      }
      
      override protected function §_-Mw§(param1:§_-dd§) : void
      {
         this.§_-o2S§(param1 as §_-n1V§);
         this.§_-l15§();
         super.§_-Mw§(param1);
      }
      
      private function §_-o2S§(param1:§_-n1V§) : void
      {
         var _loc2_:§_-22V§ = new §_-22V§("",0,0,this.style);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-o1P§,false,0,true);
         _loc2_.htmlText = param1.text;
         _loc2_.userData = param1;
         _loc2_.wordWrap = true;
         _loc2_.width = §_-O2I§;
         _loc2_.x = 12;
         _loc2_.y = this.§_-Wa§.length > 0 ? this.§_-Wa§[this.§_-Wa§.length - 1].y + this.§_-Wa§[this.§_-Wa§.length - 1].height : 0;
         addChild(_loc2_);
         this.§_-Wa§.push(_loc2_);
      }
      
      private function §_-o1P§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = param1.target as §_-22V§;
         if(!_loc2_.userData || §_-n1V§(_loc2_.userData).userId <= 0)
         {
            param1.stopImmediatePropagation();
            return;
         }
         §_-927§.§_-i2I§(§_-n1V§(_loc2_.userData).userId);
      }
      
      private function §_-l15§() : void
      {
         if(this.height < §_-41G§ || this.§_-Wa§.length <= §_-G1R§)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-Wa§.length)
         {
            if(_loc1_ < §_-G1R§)
            {
               removeChild(this.§_-Wa§[_loc1_]);
               this.§_-Wa§[_loc1_].removeEventListener(MouseEvent.MOUSE_UP,this.§_-o1P§);
            }
            else
            {
               this.§_-Wa§[_loc1_].y = _loc1_ == §_-G1R§ ? 0 : this.§_-Wa§[_loc1_ - 1].y + this.§_-Wa§[_loc1_ - 1].height;
            }
            _loc1_++;
         }
         this.§_-Wa§.splice(0,§_-G1R§);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-aR§:
               if(param1[0] != this.type)
               {
                  return;
               }
               if(§_-IP§.§_-r1m§(param1[1]))
               {
                  return;
               }
               §_-72y§(new §_-n1V§(Game.getPlayer(param1[1]),param1[2]));
         }
         if(param1[1] != Game.self.id && !(§_-71o§.active is §_-92z§ || §_-71o§.active is §_-P1Y§))
         {
            GameSounds.play("message_recieve");
         }
      }
   }
}

