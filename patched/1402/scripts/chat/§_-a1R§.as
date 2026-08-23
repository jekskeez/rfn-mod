package chat
{
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   
   public class §_-a1R§ extends §_-N2t§
   {
      
      private static const §_-e1N§:int = 235;
      
      private static const §_-Z1d§:int = 50;
      
      private static const §_-x17§:int = 5000;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #C9FFFF;","text-align: left;","}",".justify {","text-align: justify;","}",".name {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".service_message {","color: #F7CF81;","}",".vip_message {","color: #FEFE00;","}",".name_shaman {","color: #A6DAF7;","font-weight: bold;","}",".name_leader {","color: #FF0000;","font-weight: bold;","}",".name_moderator {","color: #7CF772;","font-weight: bold;","}",".color0 {","color: #FFFFFF;","font-weight: bold;","}",".color1 {","color: #FF5A3A;","font-weight: bold;","}",".color2 {","color: #FFA800;","font-weight: bold;","}",".color3 {","color: #FFF12A;","font-weight: bold;","}",".color4 {","color: #FFC8FF;","font-weight: bold;","}",".color5 {","color: #66F2FF;","font-weight: bold;","}",".color6 {","color: #66A6FF;","font-weight: bold;","}",".color7 {","color: #EF66FF;","font-weight: bold;"
      ,"}"].join("\n");
      
      public var type:int;
      
      public var §_-A1v§:Boolean = false;
      
      private var style:StyleSheet = null;
      
      private var §_-qY§:Array = [];
      
      public function §_-a1R§(param1:int)
      {
         super();
         this.type = param1;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-Nb§]);
      }
      
      override public function §_-9x§() : void
      {
         var _loc1_:* = int(this.§_-qY§.length - 1);
         while(_loc1_ >= 0)
         {
            removeChild(this.§_-qY§[_loc1_]);
            this.§_-qY§[_loc1_].removeEventListener(MouseEvent.MOUSE_UP,this.§_-QQ§);
            _loc1_--;
         }
         this.§_-qY§.splice(0);
      }
      
      public function §_-B2s§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            §_-GH§(new §_-EU§(Game.getPlayer(param1[_loc2_]),param1[_loc2_ + 1]));
            _loc2_ += 2;
         }
         §_-GH§(new §_-EU§(null,gls("<span class=\'justify\'>Добро пожаловать в чат. Пожалуйста, соблюдай <a href=\'{0}\' target=\'_blank\'>правила</a>.\nЗнакомьcя, общайся, приглашай друзей.</span>",§_-Zy§.§_-Bv§[§_-Zy§.§_-73r§].rules)));
      }
      
      public function flush() : void
      {
         dispose();
      }
      
      override protected function §_-f9§(param1:§_-e28§) : void
      {
         this.§_-s17§(param1 as §_-EU§);
         this.§_-c28§();
         super.§_-f9§(param1);
      }
      
      private function §_-s17§(param1:§_-EU§) : void
      {
         var _loc2_:§_-i5§ = new §_-i5§("",0,0,this.style);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-QQ§,false,0,true);
         _loc2_.htmlText = param1.text;
         _loc2_.userData = param1;
         _loc2_.wordWrap = true;
         _loc2_.width = §_-e1N§;
         _loc2_.x = 12;
         _loc2_.y = this.§_-qY§.length > 0 ? this.§_-qY§[this.§_-qY§.length - 1].y + this.§_-qY§[this.§_-qY§.length - 1].height : 0;
         addChild(_loc2_);
         this.§_-qY§.push(_loc2_);
      }
      
      private function §_-QQ§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = param1.target as §_-i5§;
         if(!_loc2_.userData || §_-EU§(_loc2_.userData).userId <= 0)
         {
            param1.stopImmediatePropagation();
            return;
         }
         §_-cD§.§_-e25§(§_-EU§(_loc2_.userData).userId);
      }
      
      private function §_-c28§() : void
      {
         if(this.height < §_-x17§ || this.§_-qY§.length <= §_-Z1d§)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-qY§.length)
         {
            if(_loc1_ < §_-Z1d§)
            {
               removeChild(this.§_-qY§[_loc1_]);
               this.§_-qY§[_loc1_].removeEventListener(MouseEvent.MOUSE_UP,this.§_-QQ§);
            }
            else
            {
               this.§_-qY§[_loc1_].y = _loc1_ == §_-Z1d§ ? 0 : this.§_-qY§[_loc1_ - 1].y + this.§_-qY§[_loc1_ - 1].height;
            }
            _loc1_++;
         }
         this.§_-qY§.splice(0,§_-Z1d§);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-Nb§:
               if(param1[0] != this.type)
               {
                  return;
               }
               if(§_-u1T§.§_-P1f§(param1[1]))
               {
                  return;
               }
               §_-GH§(new §_-EU§(Game.getPlayer(param1[1]),param1[2]));
         }
         if(param1[1] != Game.self.id && !(§_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-H1k§))
         {
            GameSounds.play("message_recieve");
         }
      }
   }
}

