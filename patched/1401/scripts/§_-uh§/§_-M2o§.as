package §_-uh§
{
   import §_-X1o§.§_-51z§;
   import §_-X1o§.§_-Lf§;
   import §_-X1o§.§_-X27§;
   import §_-X1o§.§_-u1R§;
   import §_-k1c§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-M2o§ extends Dialog
   {
      
      private static const §_-V0§:int = 0;
      
      private static const §_-Ta§:int = 10;
      
      private static const WIDTH:int = 340;
      
      private static const §_-G2i§:TextFormat = new TextFormat(null,35,16711680,true,null,null,null,null,"center");
      
      private static const §_-v2T§:TextFormat = new TextFormat(null,35,869308,true,null,null,null,null,"center");
      
      private static const §_-CD§:TextFormat = new TextFormat(null,16,6700045,true,null,null,null,null,"center");
      
      private static const §_-E1z§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,12387328,null,null,null,null,null,"center");
      
      private static const §_-R2I§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,930176,null,null,null,null,null,"center");
      
      private var §_-hD§:RedTeamWinImage;
      
      private var §_-X2G§:BlueTeamWinImage;
      
      private var §_-y2f§:RedTeamLoseImage;
      
      private var §_-hj§:BlueTeamLoseImage;
      
      private var §_-mq§:DrawTeamWinImage;
      
      private var §_-R1W§:§_-22V§ = null;
      
      private var §_-JA§:§_-22V§ = null;
      
      private var §_-E1O§:§_-22V§;
      
      private var §_-AZ§:Sprite = new Sprite();
      
      private var §_-23x§:PrizeBg;
      
      private var §_-XZ§:§_-u1R§ = new §_-u1R§();
      
      private var §_-73g§:§_-u1R§ = new §_-u1R§();
      
      private var §_-n14§:Sprite = null;
      
      public function §_-M2o§()
      {
         super("");
         this.init();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(!Game.§_-d2t§.contains(this))
         {
            return;
         }
         Game.§_-d2t§.removeChild(this);
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-z2t§,Game.self["type"]);
      }
      
      public function §_-X2t§(param1:Array, param2:int) : void
      {
         var _loc3_:int = int(param1[0]);
         var _loc4_:int = int(param1[1]);
         var _loc5_:Boolean = _loc3_ < _loc4_;
         var _loc6_:Boolean = _loc3_ > _loc4_;
         var _loc7_:Boolean = param2 != Hero.§_-JL§ && (_loc6_ && param2 == Hero.§_-17§ || _loc5_ && param2 == Hero.§_-114§);
         this.§_-E1O§.visible = (_loc7_ || param2 == Hero.§_-JL§) && (_loc6_ || _loc5_);
         this.§_-E1O§.text = _loc6_ ? gls("Участники красной команды получают") : gls("Участники синей команды получают");
         this.§_-AZ§.visible = (_loc7_ || param2 == Hero.§_-JL§) && (_loc6_ || _loc5_);
         this.§_-hD§.visible = _loc6_ && (_loc7_ || param2 == Hero.§_-JL§);
         this.§_-X2G§.visible = _loc5_ && (_loc7_ || param2 == Hero.§_-JL§);
         this.§_-y2f§.visible = _loc5_ && !(_loc7_ || param2 == Hero.§_-JL§);
         this.§_-hj§.visible = _loc6_ && !(_loc7_ || param2 == Hero.§_-JL§);
         this.§_-mq§.visible = !_loc6_ && !_loc5_;
         this.§_-R1W§.text = _loc4_.toString();
         this.§_-JA§.text = _loc3_.toString();
         this.height = this.§_-n14§.y + this.§_-LP§ * §_-Lf§.§_-kI§ + 50 + this.topOffset;
         if(_loc7_ || param2 == Hero.§_-JL§)
         {
            this.§_-E1O§.y = this.§_-n14§.y + this.§_-LP§ * §_-Lf§.§_-kI§ + 45;
            this.§_-AZ§.y = this.§_-E1O§.y + 20;
            this.height = this.§_-AZ§.y + this.§_-AZ§.height + 55;
         }
         if(_loc5_)
         {
            this.§_-R1W§.x = this.§_-hj§.x + 78;
            this.§_-JA§.x = this.§_-hj§.x + 134;
            this.§_-R1W§.y = this.§_-hj§.y + 223;
            this.§_-JA§.y = this.§_-hj§.y + 217;
            return;
         }
         if(_loc6_)
         {
            this.§_-R1W§.x = this.§_-hj§.x + 79;
            this.§_-JA§.x = this.§_-hj§.x + 131;
            this.§_-R1W§.y = this.§_-hj§.y + 225;
            this.§_-JA§.y = this.§_-hj§.y + 219;
            return;
         }
         this.§_-R1W§.x = this.§_-hj§.x + 67;
         this.§_-JA§.x = this.§_-hj§.x + 124;
         this.§_-R1W§.y = this.§_-hj§.y + 133;
         this.§_-JA§.y = this.§_-hj§.y + 126;
      }
      
      public function §_-sz§(param1:int = 30, param2:int = 5) : void
      {
         var _loc8_:§_-22V§ = null;
         var _loc9_:DisplayObject = null;
         while(this.§_-AZ§.numChildren > 0)
         {
            this.§_-AZ§.removeChildAt(0);
         }
         this.§_-AZ§.addChild(this.§_-23x§);
         var _loc3_:TextFormat = new TextFormat(null,14,0,true);
         var _loc4_:Array = [param2,param1];
         var _loc5_:Array = [new ImageIconNut(),new ImageIconExp()];
         var _loc6_:int = 126;
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            if(_loc4_[_loc7_] != 0)
            {
               _loc8_ = new §_-22V§(_loc4_[_loc7_],_loc6_,15,_loc3_);
               _loc8_.filters = [new DropShadowFilter(0,0,16777215,0.9,4,4,7)];
               this.§_-AZ§.addChild(_loc8_);
               _loc6_ += _loc8_.textWidth + 10;
               _loc9_ = _loc5_[_loc7_];
               _loc9_.scaleX = _loc9_.scaleY = 0.7;
               _loc9_.x = _loc6_;
               _loc9_.y = 15;
               this.§_-AZ§.addChild(_loc9_);
               _loc6_ += _loc9_.width + 5;
            }
            _loc7_++;
         }
      }
      
      public function §_-I1K§(param1:Vector.<§_-X27§>, param2:Vector.<§_-X27§>) : void
      {
         var _loc3_:§_-51z§ = new §_-51z§();
         _loc3_.setData(param1);
         var _loc4_:§_-51z§ = new §_-51z§();
         _loc4_.setData(param2);
         this.§_-73g§.setData(_loc4_);
         this.§_-XZ§.setData(_loc3_);
      }
      
      private function init() : void
      {
         this.§_-hD§ = new RedTeamWinImage();
         this.§_-hD§.addChild(new §_-22V§(gls("Твоя команда"),0,0,§_-CD§,308));
         this.§_-hD§.addChild(new §_-22V§(gls("Победила"),0,28,§_-E1z§,308));
         this.§_-hD§.x = int((WIDTH - this.§_-hD§.width) * 0.5);
         this.§_-hD§.y = §_-Ta§;
         addChild(this.§_-hD§);
         this.§_-y2f§ = new RedTeamLoseImage();
         this.§_-y2f§.addChild(new §_-22V§(gls("Твоя команда"),0,0,§_-CD§,308));
         this.§_-y2f§.addChild(new §_-22V§(gls("Проиграла"),0,28,§_-E1z§,308));
         this.§_-y2f§.x = int((WIDTH - this.§_-y2f§.width) * 0.5);
         this.§_-y2f§.y = §_-Ta§;
         addChild(this.§_-y2f§);
         this.§_-X2G§ = new BlueTeamWinImage();
         this.§_-X2G§.addChild(new §_-22V§(gls("Твоя команда"),0,0,§_-CD§,308));
         this.§_-X2G§.addChild(new §_-22V§(gls("Победила"),0,28,§_-R2I§,308));
         this.§_-X2G§.x = int((WIDTH - this.§_-X2G§.width) * 0.5);
         this.§_-X2G§.y = §_-Ta§;
         addChild(this.§_-X2G§);
         this.§_-hj§ = new BlueTeamLoseImage();
         this.§_-hj§.addChild(new §_-22V§(gls("Твоя команда"),0,0,§_-CD§,308));
         this.§_-hj§.addChild(new §_-22V§(gls("Проиграла"),0,28,§_-R2I§,308));
         this.§_-hj§.x = int((WIDTH - this.§_-hj§.width) * 0.5);
         this.§_-hj§.y = §_-Ta§;
         addChild(this.§_-hj§);
         this.§_-mq§ = new DrawTeamWinImage();
         this.§_-mq§.addChild(new §_-22V§(gls("Ничья"),0,0,§_-CD§,308));
         this.§_-mq§.x = int((WIDTH - this.§_-mq§.width) * 0.5);
         this.§_-mq§.y = §_-Ta§;
         addChild(this.§_-mq§);
         this.§_-R1W§ = new §_-22V§("",0,0,§_-v2T§,106);
         this.§_-R1W§.rotation = -5;
         addChild(this.§_-R1W§);
         this.§_-JA§ = new §_-22V§("",0,0,§_-G2i§,106);
         this.§_-JA§.rotation = -5;
         addChild(this.§_-JA§);
         this.§_-E1O§ = new §_-22V§("",0,0,new TextFormat(null,13,6765838,true,null,null,null,null,"center"));
         this.§_-E1O§.width = WIDTH;
         this.§_-E1O§.wordWrap = true;
         this.§_-E1O§.multiline = true;
         this.§_-E1O§.mouseEnabled = false;
         addChild(this.§_-E1O§);
         addChild(this.§_-AZ§);
         this.§_-23x§ = new PrizeBg();
         this.§_-23x§.x = int((WIDTH - this.§_-23x§.width) * 0.5);
         this.§_-AZ§.addChild(this.§_-23x§);
         this.§_-n14§ = new Sprite();
         this.§_-n14§.addChild(new §_-22V§(gls("Заработанные очки:"),90,0,new TextFormat(null,13,6700045,true)));
         this.§_-n14§.addChild(new §_-22V§(gls("Красная команда"),173,19,new TextFormat(null,13,16391453,true)));
         this.§_-n14§.addChild(new §_-22V§(gls("Синяя команда"),3,19,new TextFormat(null,13,2643905,true)));
         this.§_-XZ§.x = 172;
         this.§_-XZ§.y = 37;
         this.§_-n14§.addChild(this.§_-XZ§);
         this.§_-73g§.y = 37;
         this.§_-n14§.addChild(this.§_-73g§);
         this.§_-n14§.x = §_-V0§;
         this.§_-n14§.y = §_-Ta§ + 290;
         addChild(this.§_-n14§);
         place();
      }
      
      private function get §_-LP§() : int
      {
         return Math.max(this.§_-XZ§.§_-WK§,this.§_-73g§.§_-WK§);
      }
   }
}

