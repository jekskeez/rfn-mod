package views
{
   import §_-I10§.§_-O1T§;
   import §_-I10§.§_-f2P§;
   import §_-Kr§.ScrollPane;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-J29§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-G2L§;
   import buttons.§_-p2d§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-w2v§;
   
   public class §_-C3S§ extends Sprite
   {
      
      public static const WIDTH:int = 400;
      
      public static const §_-kI§:int = 110;
      
      private var category:Vector.<Vector.<§_-F1X§>> = new Vector.<Vector.<§_-F1X§>>();
      
      private var §_-zq§:Vector.<ScrollPane> = new Vector.<ScrollPane>();
      
      private var §_-32O§:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-J4§:§_-G2L§ = new §_-G2L§();
      
      private var §_-kF§:SimpleButton = null;
      
      private var §_-Pi§:SimpleButton = null;
      
      private var §_-r1e§:SimpleButton = null;
      
      private var §_-95§:SimpleButton = null;
      
      private var §_-526§:Boolean = true;
      
      private var §_-hc§:Boolean = true;
      
      private var §_-Nn§:§_-w2v§ = null;
      
      private var §_-yp§:§_-22V§ = null;
      
      private var §_-I2A§:Boolean = true;
      
      public function §_-C3S§()
      {
         super();
         this.init();
         §_-f2P§.addEventListener(GameEvent.AWARD_UPDATE,this.update);
      }
      
      public function §_-027§() : void
      {
         if(this.§_-I2A§)
         {
            this.update();
         }
         this.§_-I2A§ = false;
      }
      
      private function init() : void
      {
         var _loc2_:Object = null;
         var _loc3_:Vector.<§_-F1X§> = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:ScrollPane = null;
         var _loc7_:int = 0;
         var _loc8_:§_-F1X§ = null;
         var _loc9_:§_-p2d§ = null;
         this.§_-Nn§ = new §_-w2v§([{
            "image":new AwardTotalBack(),
            "X":0,
            "Y":0
         },{
            "image":new AwardTotalActive(),
            "X":0,
            "Y":0
         },{
            "image":new AwardTotalActive(),
            "X":0,
            "Y":0
         }],580);
         this.§_-Nn§.x = 160;
         this.§_-Nn§.y = 50;
         addChild(this.§_-Nn§);
         this.§_-yp§ = new §_-22V§("0/0",450,48,new TextFormat(null,16,16777215,true));
         addChild(this.§_-yp§);
         var _loc1_:int = 0;
         while(_loc1_ < §_-f2P§.§_-6n§)
         {
            this.category.push(new Vector.<§_-F1X§>());
            this.§_-zq§.push(new ScrollPane());
            this.§_-zq§[_loc1_].setSize(820,440);
            this.§_-zq§[_loc1_].verticalLineScrollSize = §_-kI§;
            this.§_-zq§[_loc1_].x = 40;
            this.§_-zq§[_loc1_].y = 160;
            this.§_-32O§.push(new Sprite());
            this.§_-zq§[_loc1_].source = this.§_-32O§[_loc1_];
            addChild(this.§_-zq§[_loc1_]);
            _loc1_++;
         }
         for each(_loc2_ in §_-O1T§.DATA)
         {
            _loc7_ = int(_loc2_["id"]);
            if(§_-O1T§.§_-Z1n§(_loc7_))
            {
               _loc8_ = new §_-F1X§(_loc7_);
               this.category[int(_loc2_["category"])].push(_loc8_);
            }
         }
         for each(_loc3_ in this.category)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc3_.length)
            {
               _loc3_[_loc1_].x = _loc1_ % 2 * WIDTH;
               _loc3_[_loc1_].y = int(_loc1_ * 0.5) * §_-kI§;
               this.§_-32O§[int(§_-O1T§.DATA[_loc3_[_loc1_].id]["category"])].addChild(_loc3_[_loc1_]);
               _loc1_++;
            }
         }
         _loc4_ = [gls("Базовые"),gls("Собиратель"),gls("Шаман"),gls("Эпические")];
         _loc5_ = [gls("Деяния, которые отличают настоящую белку"),gls("Награды за героическое упорство, проявленное белкой ради спасения своего народа"),gls("Награды за искусное мастерство Шамана"),gls("Здесь записаны исключительно выдающиеся деяния белок")];
         _loc1_ = 0;
         while(_loc1_ < _loc4_.length)
         {
            _loc9_ = new §_-p2d§(_loc4_[_loc1_]);
            _loc9_.§_-k1g§.§_-w10§(_loc1_ == 0);
            _loc9_.x = _loc1_ * 200;
            _loc9_.y = 80;
            new §_-Hb§(_loc9_,_loc5_[_loc1_]);
            this.§_-J4§.insert(_loc9_,this.§_-zq§[_loc1_]);
            _loc1_++;
         }
         addChild(this.§_-J4§);
         this.§_-kF§ = new ButtonShowAwardComplete();
         this.§_-Pi§ = new ButtonHideAwardComplete();
         this.§_-kF§.x = this.§_-Pi§.x = 800;
         this.§_-kF§.y = this.§_-Pi§.y = 85;
         this.§_-Pi§.visible = false;
         this.§_-kF§.addEventListener(MouseEvent.CLICK,this.§_-u2j§);
         this.§_-Pi§.addEventListener(MouseEvent.CLICK,this.§_-u2j§);
         addChild(this.§_-kF§);
         addChild(this.§_-Pi§);
         new §_-Hb§(this.§_-kF§,gls("Скрыть полученные"));
         new §_-Hb§(this.§_-Pi§,gls("Показать полученные"));
         this.§_-r1e§ = new ButtonShowAwardLock();
         this.§_-95§ = new ButtonHideAwardLock();
         this.§_-r1e§.x = this.§_-95§.x = 850;
         this.§_-r1e§.y = this.§_-95§.y = 85;
         this.§_-95§.visible = false;
         this.§_-r1e§.addEventListener(MouseEvent.CLICK,this.§_-MD§);
         this.§_-95§.addEventListener(MouseEvent.CLICK,this.§_-MD§);
         addChild(this.§_-r1e§);
         addChild(this.§_-95§);
         new §_-Hb§(this.§_-r1e§,gls("Скрыть недоступные"));
         new §_-Hb§(this.§_-95§,gls("Показать недоступные"));
         for each(_loc6_ in this.§_-zq§)
         {
            _loc6_.update();
         }
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc7_:Vector.<§_-F1X§> = null;
         var _loc8_:ScrollPane = null;
         var _loc9_:int = 0;
         var _loc10_:§_-F1X§ = null;
         if(!(§_-71o§.active is §_-J29§))
         {
            this.§_-I2A§ = true;
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = [1,2,2,7];
         var _loc6_:int = 0;
         for each(_loc7_ in this.category)
         {
            _loc9_ = 0;
            for each(_loc10_ in _loc7_)
            {
               _loc10_.update();
               _loc9_ += §_-f2P§.§_-Y2w§(_loc10_.id) ? 1 : 0;
               _loc10_.visible = !(!this.§_-526§ && §_-f2P§.§_-Y2w§(_loc10_.id) || !this.§_-hc§ && §_-f2P§.§_-D2S§(_loc10_.id));
            }
            this.§_-l13§(_loc7_);
            (this.§_-J4§.§_-Y2N§[_loc4_] as §_-p2d§).§_-B1n§(_loc9_,_loc7_.length);
            _loc2_ += _loc9_ * _loc5_[_loc6_];
            _loc3_ += _loc7_.length * _loc5_[_loc6_];
            _loc4_++;
            _loc6_++;
         }
         this.§_-Nn§.§_-B1n§(_loc2_,_loc3_);
         this.§_-yp§.text = _loc2_ + "/" + _loc3_;
         this.§_-yp§.x = this.§_-Nn§.x + int(this.§_-Nn§.width - this.§_-yp§.textWidth) * 0.5;
         for each(_loc8_ in this.§_-zq§)
         {
            _loc8_.update();
         }
         this.visible = true;
      }
      
      private function §_-u2j§(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<§_-F1X§> = null;
         var _loc3_:ScrollPane = null;
         this.§_-526§ = !this.§_-526§;
         this.§_-kF§.visible = this.§_-526§;
         this.§_-Pi§.visible = !this.§_-526§;
         for each(_loc2_ in this.category)
         {
            this.§_-l13§(_loc2_);
         }
         for each(_loc3_ in this.§_-zq§)
         {
            _loc3_.update();
         }
      }
      
      private function §_-MD§(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<§_-F1X§> = null;
         var _loc3_:ScrollPane = null;
         this.§_-hc§ = !this.§_-hc§;
         this.§_-r1e§.visible = this.§_-hc§;
         this.§_-95§.visible = !this.§_-hc§;
         for each(_loc2_ in this.category)
         {
            this.§_-l13§(_loc2_);
         }
         for each(_loc3_ in this.§_-zq§)
         {
            _loc3_.update();
         }
      }
      
      private function §_-l13§(param1:Vector.<§_-F1X§>) : void
      {
         var _loc3_:§_-F1X§ = null;
         param1.sort(this.§_-72f§);
         var _loc2_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc3_.visible = !(!this.§_-526§ && §_-f2P§.§_-Y2w§(_loc3_.id) || !this.§_-hc§ && §_-f2P§.§_-D2S§(_loc3_.id));
            _loc3_.x = _loc3_.visible ? _loc2_ % 2 * WIDTH : 0;
            _loc3_.y = _loc3_.visible ? int(_loc2_ * 0.5) * §_-kI§ : 0;
            _loc2_ += _loc3_.visible ? 1 : 0;
         }
      }
      
      private function §_-72f§(param1:§_-F1X§, param2:§_-F1X§) : int
      {
         var _loc3_:Boolean = §_-f2P§.§_-Y2w§(param1.id);
         var _loc4_:Boolean = §_-f2P§.§_-Y2w§(param2.id);
         if(_loc3_ != _loc4_)
         {
            return _loc3_ ? -1 : 1;
         }
         return param1.id > param2.id ? 1 : -1;
      }
   }
}

