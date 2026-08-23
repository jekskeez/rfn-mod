package §_-L2E§
{
   import §_-bN§.Dialog;
   import §_-cA§.§_-03k§;
   import §_-cA§.§_-3b§;
   import §_-cA§.§_-Cq§;
   import §_-cA§.§_-f1B§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-h2t§ extends Dialog
   {
      
      private static const §_-A3C§:int = 0;
      
      private static const §_-q2o§:int = 10;
      
      private static const WIDTH:int = 340;
      
      private static const §_-V2k§:TextFormat = new TextFormat(null,35,16711680,true,null,null,null,null,"center");
      
      private static const §_-916§:TextFormat = new TextFormat(null,35,869308,true,null,null,null,null,"center");
      
      private static const §_-C1Q§:TextFormat = new TextFormat(null,16,6700045,true,null,null,null,null,"center");
      
      private static const §_-U1M§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,12387328,null,null,null,null,null,"center");
      
      private static const §_-u2M§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,930176,null,null,null,null,null,"center");
      
      private var §_-m1d§:RedTeamWinImage;
      
      private var §_-1v§:BlueTeamWinImage;
      
      private var §_-p2l§:RedTeamLoseImage;
      
      private var §_-vF§:BlueTeamLoseImage;
      
      private var §_-23F§:DrawTeamWinImage;
      
      private var §_-cK§:§_-i5§ = null;
      
      private var §_-X1d§:§_-i5§ = null;
      
      private var §_-G4§:§_-i5§;
      
      private var §_-A2p§:Sprite = new Sprite();
      
      private var §_-U1U§:PrizeBg;
      
      private var §_-YR§:§_-03k§ = new §_-03k§();
      
      private var §_-EX§:§_-03k§ = new §_-03k§();
      
      private var §_-r1t§:Sprite = null;
      
      public function §_-h2t§()
      {
         super("");
         this.init();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(!Game.§_-q1L§.contains(this))
         {
            return;
         }
         Game.§_-q1L§.removeChild(this);
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-C3A§,Game.self["type"]);
      }
      
      public function §_-nu§(param1:Array, param2:int) : void
      {
         var _loc3_:int = int(param1[0]);
         var _loc4_:int = int(param1[1]);
         var _loc5_:Boolean = _loc3_ < _loc4_;
         var _loc6_:Boolean = _loc3_ > _loc4_;
         var _loc7_:Boolean = param2 != Hero.§_-PM§ && (_loc6_ && param2 == Hero.§_-l1B§ || _loc5_ && param2 == Hero.§_-i1Y§);
         this.§_-G4§.visible = (_loc7_ || param2 == Hero.§_-PM§) && (_loc6_ || _loc5_);
         this.§_-G4§.text = _loc6_ ? gls("Участники красной команды получают") : gls("Участники синей команды получают");
         this.§_-A2p§.visible = (_loc7_ || param2 == Hero.§_-PM§) && (_loc6_ || _loc5_);
         this.§_-m1d§.visible = _loc6_ && (_loc7_ || param2 == Hero.§_-PM§);
         this.§_-1v§.visible = _loc5_ && (_loc7_ || param2 == Hero.§_-PM§);
         this.§_-p2l§.visible = _loc5_ && !(_loc7_ || param2 == Hero.§_-PM§);
         this.§_-vF§.visible = _loc6_ && !(_loc7_ || param2 == Hero.§_-PM§);
         this.§_-23F§.visible = !_loc6_ && !_loc5_;
         this.§_-cK§.text = _loc4_.toString();
         this.§_-X1d§.text = _loc3_.toString();
         this.height = this.§_-r1t§.y + this.§_-82v§ * §_-Cq§.§_-i2u§ + 50 + this.topOffset;
         if(_loc7_ || param2 == Hero.§_-PM§)
         {
            this.§_-G4§.y = this.§_-r1t§.y + this.§_-82v§ * §_-Cq§.§_-i2u§ + 45;
            this.§_-A2p§.y = this.§_-G4§.y + 20;
            this.height = this.§_-A2p§.y + this.§_-A2p§.height + 55;
         }
         if(_loc5_)
         {
            this.§_-cK§.x = this.§_-vF§.x + 78;
            this.§_-X1d§.x = this.§_-vF§.x + 134;
            this.§_-cK§.y = this.§_-vF§.y + 223;
            this.§_-X1d§.y = this.§_-vF§.y + 217;
            return;
         }
         if(_loc6_)
         {
            this.§_-cK§.x = this.§_-vF§.x + 79;
            this.§_-X1d§.x = this.§_-vF§.x + 131;
            this.§_-cK§.y = this.§_-vF§.y + 225;
            this.§_-X1d§.y = this.§_-vF§.y + 219;
            return;
         }
         this.§_-cK§.x = this.§_-vF§.x + 67;
         this.§_-X1d§.x = this.§_-vF§.x + 124;
         this.§_-cK§.y = this.§_-vF§.y + 133;
         this.§_-X1d§.y = this.§_-vF§.y + 126;
      }
      
      public function §_-n1S§(param1:int = 30, param2:int = 5) : void
      {
         var _loc8_:§_-i5§ = null;
         var _loc9_:DisplayObject = null;
         while(this.§_-A2p§.numChildren > 0)
         {
            this.§_-A2p§.removeChildAt(0);
         }
         this.§_-A2p§.addChild(this.§_-U1U§);
         var _loc3_:TextFormat = new TextFormat(null,14,0,true);
         var _loc4_:Array = [param2,param1];
         var _loc5_:Array = [new ImageIconNut(),new ImageIconExp()];
         var _loc6_:int = 126;
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            if(_loc4_[_loc7_] != 0)
            {
               _loc8_ = new §_-i5§(_loc4_[_loc7_],_loc6_,15,_loc3_);
               _loc8_.filters = [new DropShadowFilter(0,0,16777215,0.9,4,4,7)];
               this.§_-A2p§.addChild(_loc8_);
               _loc6_ += _loc8_.textWidth + 10;
               _loc9_ = _loc5_[_loc7_];
               _loc9_.scaleX = _loc9_.scaleY = 0.7;
               _loc9_.x = _loc6_;
               _loc9_.y = 15;
               this.§_-A2p§.addChild(_loc9_);
               _loc6_ += _loc9_.width + 5;
            }
            _loc7_++;
         }
      }
      
      public function §_-o2y§(param1:Vector.<§_-3b§>, param2:Vector.<§_-3b§>) : void
      {
         var _loc3_:§_-f1B§ = new §_-f1B§();
         _loc3_.setData(param1);
         var _loc4_:§_-f1B§ = new §_-f1B§();
         _loc4_.setData(param2);
         this.§_-EX§.setData(_loc4_);
         this.§_-YR§.setData(_loc3_);
      }
      
      private function init() : void
      {
         this.§_-m1d§ = new RedTeamWinImage();
         this.§_-m1d§.addChild(new §_-i5§(gls("Твоя команда"),0,0,§_-C1Q§,308));
         this.§_-m1d§.addChild(new §_-i5§(gls("Победила"),0,28,§_-U1M§,308));
         this.§_-m1d§.x = int((WIDTH - this.§_-m1d§.width) * 0.5);
         this.§_-m1d§.y = §_-q2o§;
         addChild(this.§_-m1d§);
         this.§_-p2l§ = new RedTeamLoseImage();
         this.§_-p2l§.addChild(new §_-i5§(gls("Твоя команда"),0,0,§_-C1Q§,308));
         this.§_-p2l§.addChild(new §_-i5§(gls("Проиграла"),0,28,§_-U1M§,308));
         this.§_-p2l§.x = int((WIDTH - this.§_-p2l§.width) * 0.5);
         this.§_-p2l§.y = §_-q2o§;
         addChild(this.§_-p2l§);
         this.§_-1v§ = new BlueTeamWinImage();
         this.§_-1v§.addChild(new §_-i5§(gls("Твоя команда"),0,0,§_-C1Q§,308));
         this.§_-1v§.addChild(new §_-i5§(gls("Победила"),0,28,§_-u2M§,308));
         this.§_-1v§.x = int((WIDTH - this.§_-1v§.width) * 0.5);
         this.§_-1v§.y = §_-q2o§;
         addChild(this.§_-1v§);
         this.§_-vF§ = new BlueTeamLoseImage();
         this.§_-vF§.addChild(new §_-i5§(gls("Твоя команда"),0,0,§_-C1Q§,308));
         this.§_-vF§.addChild(new §_-i5§(gls("Проиграла"),0,28,§_-u2M§,308));
         this.§_-vF§.x = int((WIDTH - this.§_-vF§.width) * 0.5);
         this.§_-vF§.y = §_-q2o§;
         addChild(this.§_-vF§);
         this.§_-23F§ = new DrawTeamWinImage();
         this.§_-23F§.addChild(new §_-i5§(gls("Ничья"),0,0,§_-C1Q§,308));
         this.§_-23F§.x = int((WIDTH - this.§_-23F§.width) * 0.5);
         this.§_-23F§.y = §_-q2o§;
         addChild(this.§_-23F§);
         this.§_-cK§ = new §_-i5§("",0,0,§_-916§,106);
         this.§_-cK§.rotation = -5;
         addChild(this.§_-cK§);
         this.§_-X1d§ = new §_-i5§("",0,0,§_-V2k§,106);
         this.§_-X1d§.rotation = -5;
         addChild(this.§_-X1d§);
         this.§_-G4§ = new §_-i5§("",0,0,new TextFormat(null,13,6765838,true,null,null,null,null,"center"));
         this.§_-G4§.width = WIDTH;
         this.§_-G4§.wordWrap = true;
         this.§_-G4§.multiline = true;
         this.§_-G4§.mouseEnabled = false;
         addChild(this.§_-G4§);
         addChild(this.§_-A2p§);
         this.§_-U1U§ = new PrizeBg();
         this.§_-U1U§.x = int((WIDTH - this.§_-U1U§.width) * 0.5);
         this.§_-A2p§.addChild(this.§_-U1U§);
         this.§_-r1t§ = new Sprite();
         this.§_-r1t§.addChild(new §_-i5§(gls("Заработанные очки:"),90,0,new TextFormat(null,13,6700045,true)));
         this.§_-r1t§.addChild(new §_-i5§(gls("Красная команда"),173,19,new TextFormat(null,13,16391453,true)));
         this.§_-r1t§.addChild(new §_-i5§(gls("Синяя команда"),3,19,new TextFormat(null,13,2643905,true)));
         this.§_-YR§.x = 172;
         this.§_-YR§.y = 37;
         this.§_-r1t§.addChild(this.§_-YR§);
         this.§_-EX§.y = 37;
         this.§_-r1t§.addChild(this.§_-EX§);
         this.§_-r1t§.x = §_-A3C§;
         this.§_-r1t§.y = §_-q2o§ + 290;
         addChild(this.§_-r1t§);
         place();
      }
      
      private function get §_-82v§() : int
      {
         return Math.max(this.§_-YR§.§_-y2i§,this.§_-EX§.§_-y2i§);
      }
   }
}

