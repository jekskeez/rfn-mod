package views
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-86§;
   import §_-X1k§.§_-K0§;
   import §_-bN§.DialogRepost;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-8p§;
   import utils.§_-j2O§;
   import utils.§_-y1l§;
   
   public class §_-j2J§ extends Sprite
   {
      
      public static const §_-E1D§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,6697728,true);
      
      public static const TEXT:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,6697728,false);
      
      public static const §_-f1H§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,16777215,true);
      
      public var id:int;
      
      private var §_-f2M§:DisplayObject;
      
      private var §_-11b§:§_-8p§;
      
      private var field:§_-i5§;
      
      private var §_-B2p§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var §_-v2C§:DisplayObject;
      
      private var §_-u1V§:DisplayObject;
      
      private var §_-vA§:DisplayObject;
      
      private var §_-oj§:§_-kr§;
      
      public function §_-j2J§(param1:int)
      {
         super();
         this.id = param1;
         this.init();
      }
      
      public function update() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc1_:uint = §_-86§.§_-D2n§(this.id);
         if(§_-86§.§_-2W§(this.id) == null)
         {
            _loc2_ = uint(§_-K0§.DATA[this.id]["total"]);
            _loc3_ = §_-86§.§_-HU§(this.id);
            _loc4_ = §_-86§.§_-m2m§(this.id);
            this.§_-11b§.§_-d1Z§(_loc1_,_loc2_);
            this.§_-11b§.buttonMode = _loc3_;
            this.field.text = _loc1_ + "/" + _loc2_;
            this.field.x = 110 - this.field.textWidth * 0.5;
            this.§_-oj§.setStatus(_loc3_ ? gls("<body>Рассказать друзьям</body>") : gls("<body>Выполняется...</body>"));
            if(_loc4_)
            {
               this.§_-oj§.setStatus(gls("<body>Получи достижение <b>«{0}»</b></body>",§_-86§.§_-o2u§(this.id)));
            }
            this.§_-v2C§.visible = _loc4_;
            this.§_-u1V§.visible = _loc3_;
            this.§_-vA§.visible = !_loc3_ && !_loc4_;
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < this.§_-B2p§.length)
            {
               this.§_-B2p§[_loc5_].filters = (_loc1_ & 1 << _loc5_) == 0 ? §_-y1l§.§_-Tk§ : [];
               _loc5_++;
            }
         }
         this.§_-f2M§.visible = !§_-86§.§_-HU§(this.id);
      }
      
      private function init() : void
      {
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc1_:DisplayObject = §_-K0§.§_-e14§(this.id);
         _loc1_.width = _loc1_.height = 100;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         addChild(_loc1_);
         this.§_-f2M§ = new ImageAwardMask();
         this.§_-f2M§.width = this.§_-f2M§.height = 100;
         addChild(this.§_-f2M§);
         new §_-kr§(_loc1_,gls("Рассказать друзьям"));
         graphics.beginFill(16250092);
         graphics.lineStyle(2,16049098);
         graphics.drawRoundRect(107,0,280,100,3,3);
         var _loc2_:§_-i5§ = new §_-i5§(§_-K0§.DATA[this.id]["name"],112,5,§_-E1D§);
         _loc2_.mouseEnabled = false;
         addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§(§_-K0§.DATA[this.id]["text"],112,30,TEXT);
         _loc3_.mouseEnabled = false;
         _loc3_.wordWrap = true;
         _loc3_.width = 265;
         addChild(_loc3_);
         var _loc4_:Array = §_-86§.§_-2W§(this.id);
         if(_loc4_ == null)
         {
            this.§_-11b§ = new §_-8p§([{
               "image":new AwardBack(),
               "X":0,
               "Y":0
            },{
               "image":new AwardActive(),
               "X":0,
               "Y":0.5
            },{
               "image":new AwardActive(),
               "X":0,
               "Y":0.5
            }],220);
            this.§_-11b§.x = 115;
            this.§_-11b§.y = 70;
            this.§_-11b§.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
            addChild(this.§_-11b§);
            this.§_-u1V§ = new ImageAwardBarStar();
            this.§_-u1V§.x = 225;
            this.§_-u1V§.scaleX = this.§_-u1V§.scaleY = 1.25;
            this.§_-11b§.addChild(this.§_-u1V§);
            this.§_-vA§ = new ImageBarProgress();
            this.§_-vA§.x = 225;
            this.§_-vA§.scaleX = this.§_-vA§.scaleY = 1.25;
            this.§_-11b§.addChild(this.§_-vA§);
            this.§_-v2C§ = new ImageBarLock();
            this.§_-v2C§.x = 225;
            this.§_-v2C§.scaleX = this.§_-v2C§.scaleY = 1.25;
            this.§_-11b§.addChild(this.§_-v2C§);
            this.§_-oj§ = new §_-kr§(this.§_-11b§,"",false,true);
            this.field = new §_-i5§("",0,-1,§_-f1H§);
            this.field.mouseEnabled = false;
            this.§_-11b§.addChild(this.field);
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = §_-K0§.§_-D1k§(this.id,_loc5_);
               _loc6_.x = 115 + 40 * _loc5_;
               _loc6_.y = 70;
               this.§_-B2p§.push(_loc6_);
               addChild(this.§_-B2p§[_loc5_]);
               new §_-kr§(_loc6_,_loc4_[_loc5_]);
               _loc5_++;
            }
         }
         this.update();
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         if(!§_-86§.§_-HU§(this.id))
         {
            return;
         }
         new DialogRepost(§_-j2O§.WALL_AWARD,this.id).show();
      }
   }
}

