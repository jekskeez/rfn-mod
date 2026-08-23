package views
{
   import §_-B1G§.ScrollPane;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-86§;
   import §_-X1k§.§_-K0§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-y10§;
   import buttons.§_-Hg§;
   import buttons.§_-R1p§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-8p§;
   
   public class §_-B2y§ extends Sprite
   {
      
      public static const WIDTH:int = 400;
      
      public static const §_-i2u§:int = 110;
      
      private var category:Vector.<Vector.<§_-j2J§>> = new Vector.<Vector.<§_-j2J§>>();
      
      private var §_-02l§:Vector.<ScrollPane> = new Vector.<ScrollPane>();
      
      private var §_-o1u§:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-z2M§:§_-Hg§ = new §_-Hg§();
      
      private var §_-v22§:SimpleButton = null;
      
      private var §_-d9§:SimpleButton = null;
      
      private var §_-s2a§:SimpleButton = null;
      
      private var §_-g1s§:SimpleButton = null;
      
      private var §_-21Z§:Boolean = true;
      
      private var §_-H2r§:Boolean = true;
      
      private var §_-y2e§:§_-8p§ = null;
      
      private var §_-97§:§_-i5§ = null;
      
      private var §_-NF§:Boolean = true;
      
      public function §_-B2y§()
      {
         super();
         this.init();
         §_-86§.addEventListener(GameEvent.AWARD_UPDATE,this.update);
      }
      
      public function §_-O1s§() : void
      {
         if(this.§_-NF§)
         {
            this.update();
         }
         this.§_-NF§ = false;
      }
      
      private function init() : void
      {
         var _loc2_:Object = null;
         var _loc3_:Vector.<§_-j2J§> = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:ScrollPane = null;
         var _loc7_:int = 0;
         var _loc8_:§_-j2J§ = null;
         var _loc9_:§_-R1p§ = null;
         this.§_-y2e§ = new §_-8p§([{
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
         this.§_-y2e§.x = 160;
         this.§_-y2e§.y = 50;
         addChild(this.§_-y2e§);
         this.§_-97§ = new §_-i5§("0/0",450,48,new TextFormat(null,16,16777215,true));
         addChild(this.§_-97§);
         var _loc1_:int = 0;
         while(_loc1_ < §_-86§.§_-x2G§)
         {
            this.category.push(new Vector.<§_-j2J§>());
            this.§_-02l§.push(new ScrollPane());
            this.§_-02l§[_loc1_].setSize(820,440);
            this.§_-02l§[_loc1_].verticalLineScrollSize = §_-i2u§;
            this.§_-02l§[_loc1_].x = 40;
            this.§_-02l§[_loc1_].y = 160;
            this.§_-o1u§.push(new Sprite());
            this.§_-02l§[_loc1_].source = this.§_-o1u§[_loc1_];
            addChild(this.§_-02l§[_loc1_]);
            _loc1_++;
         }
         for each(_loc2_ in §_-K0§.DATA)
         {
            _loc7_ = int(_loc2_["id"]);
            if(§_-K0§.§_-9a§(_loc7_))
            {
               _loc8_ = new §_-j2J§(_loc7_);
               this.category[int(_loc2_["category"])].push(_loc8_);
            }
         }
         for each(_loc3_ in this.category)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc3_.length)
            {
               _loc3_[_loc1_].x = _loc1_ % 2 * WIDTH;
               _loc3_[_loc1_].y = int(_loc1_ * 0.5) * §_-i2u§;
               this.§_-o1u§[int(§_-K0§.DATA[_loc3_[_loc1_].id]["category"])].addChild(_loc3_[_loc1_]);
               _loc1_++;
            }
         }
         _loc4_ = [gls("Базовые"),gls("Собиратель"),gls("Шаман"),gls("Эпические")];
         _loc5_ = [gls("Деяния, которые отличают настоящую белку"),gls("Награды за героическое упорство, проявленное белкой ради спасения своего народа"),gls("Награды за искусное мастерство Шамана"),gls("Здесь записаны исключительно выдающиеся деяния белок")];
         _loc1_ = 0;
         while(_loc1_ < _loc4_.length)
         {
            _loc9_ = new §_-R1p§(_loc4_[_loc1_]);
            _loc9_.§_-11b§.§_-n2d§(_loc1_ == 0);
            _loc9_.x = _loc1_ * 200;
            _loc9_.y = 80;
            new §_-kr§(_loc9_,_loc5_[_loc1_]);
            this.§_-z2M§.insert(_loc9_,this.§_-02l§[_loc1_]);
            _loc1_++;
         }
         addChild(this.§_-z2M§);
         this.§_-v22§ = new ButtonShowAwardComplete();
         this.§_-d9§ = new ButtonHideAwardComplete();
         this.§_-v22§.x = this.§_-d9§.x = 800;
         this.§_-v22§.y = this.§_-d9§.y = 85;
         this.§_-d9§.visible = false;
         this.§_-v22§.addEventListener(MouseEvent.CLICK,this.§_-J2f§);
         this.§_-d9§.addEventListener(MouseEvent.CLICK,this.§_-J2f§);
         addChild(this.§_-v22§);
         addChild(this.§_-d9§);
         new §_-kr§(this.§_-v22§,gls("Скрыть полученные"));
         new §_-kr§(this.§_-d9§,gls("Показать полученные"));
         this.§_-s2a§ = new ButtonShowAwardLock();
         this.§_-g1s§ = new ButtonHideAwardLock();
         this.§_-s2a§.x = this.§_-g1s§.x = 850;
         this.§_-s2a§.y = this.§_-g1s§.y = 85;
         this.§_-g1s§.visible = false;
         this.§_-s2a§.addEventListener(MouseEvent.CLICK,this.§_-g1u§);
         this.§_-g1s§.addEventListener(MouseEvent.CLICK,this.§_-g1u§);
         addChild(this.§_-s2a§);
         addChild(this.§_-g1s§);
         new §_-kr§(this.§_-s2a§,gls("Скрыть недоступные"));
         new §_-kr§(this.§_-g1s§,gls("Показать недоступные"));
         for each(_loc6_ in this.§_-02l§)
         {
            _loc6_.update();
         }
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc7_:Vector.<§_-j2J§> = null;
         var _loc8_:ScrollPane = null;
         var _loc9_:int = 0;
         var _loc10_:§_-j2J§ = null;
         if(!(§_-t2c§.active is §_-y10§))
         {
            this.§_-NF§ = true;
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
               _loc9_ += §_-86§.§_-HU§(_loc10_.id) ? 1 : 0;
               _loc10_.visible = !(!this.§_-21Z§ && §_-86§.§_-HU§(_loc10_.id) || !this.§_-H2r§ && §_-86§.§_-m2m§(_loc10_.id));
            }
            this.§_-ZU§(_loc7_);
            (this.§_-z2M§.§_-a3§[_loc4_] as §_-R1p§).§_-d1Z§(_loc9_,_loc7_.length);
            _loc2_ += _loc9_ * _loc5_[_loc6_];
            _loc3_ += _loc7_.length * _loc5_[_loc6_];
            _loc4_++;
            _loc6_++;
         }
         this.§_-y2e§.§_-d1Z§(_loc2_,_loc3_);
         this.§_-97§.text = _loc2_ + "/" + _loc3_;
         this.§_-97§.x = this.§_-y2e§.x + int(this.§_-y2e§.width - this.§_-97§.textWidth) * 0.5;
         for each(_loc8_ in this.§_-02l§)
         {
            _loc8_.update();
         }
         this.visible = true;
      }
      
      private function §_-J2f§(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<§_-j2J§> = null;
         var _loc3_:ScrollPane = null;
         this.§_-21Z§ = !this.§_-21Z§;
         this.§_-v22§.visible = this.§_-21Z§;
         this.§_-d9§.visible = !this.§_-21Z§;
         for each(_loc2_ in this.category)
         {
            this.§_-ZU§(_loc2_);
         }
         for each(_loc3_ in this.§_-02l§)
         {
            _loc3_.update();
         }
      }
      
      private function §_-g1u§(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<§_-j2J§> = null;
         var _loc3_:ScrollPane = null;
         this.§_-H2r§ = !this.§_-H2r§;
         this.§_-s2a§.visible = this.§_-H2r§;
         this.§_-g1s§.visible = !this.§_-H2r§;
         for each(_loc2_ in this.category)
         {
            this.§_-ZU§(_loc2_);
         }
         for each(_loc3_ in this.§_-02l§)
         {
            _loc3_.update();
         }
      }
      
      private function §_-ZU§(param1:Vector.<§_-j2J§>) : void
      {
         var _loc3_:§_-j2J§ = null;
         param1.sort(this.§_-HI§);
         var _loc2_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc3_.visible = !(!this.§_-21Z§ && §_-86§.§_-HU§(_loc3_.id) || !this.§_-H2r§ && §_-86§.§_-m2m§(_loc3_.id));
            _loc3_.x = _loc3_.visible ? _loc2_ % 2 * WIDTH : 0;
            _loc3_.y = _loc3_.visible ? int(_loc2_ * 0.5) * §_-i2u§ : 0;
            _loc2_ += _loc3_.visible ? 1 : 0;
         }
      }
      
      private function §_-HI§(param1:§_-j2J§, param2:§_-j2J§) : int
      {
         var _loc3_:Boolean = §_-86§.§_-HU§(param1.id);
         var _loc4_:Boolean = §_-86§.§_-HU§(param2.id);
         if(_loc3_ != _loc4_)
         {
            return _loc3_ ? -1 : 1;
         }
         return param1.id > param2.id ? 1 : -1;
      }
   }
}

