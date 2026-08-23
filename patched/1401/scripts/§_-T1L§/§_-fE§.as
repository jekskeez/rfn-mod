package §_-T1L§
{
   import §_-Kr§.ScrollPane;
   import §_-k1c§.Dialog;
   import §_-l26§.§_-MZ§;
   import §_-l26§.§_-z2g§;
   import §_-p1f§.§_-6Y§;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   
   public class §_-fE§ extends Dialog
   {
      
      private static const §_-531§:int = 320;
      
      private static var §_-21D§:Vector.<§_-fE§> = new Vector.<§_-fE§>(0);
      
      private var type:int = -1;
      
      private var isClan:Boolean = false;
      
      private var entityId:int = 0;
      
      private var form:§_-6Y§ = null;
      
      private var §_-J2B§:§_-j18§ = null;
      
      private var §_-Z12§:§_-j18§ = null;
      
      private var §_-M1N§:ScrollPane = null;
      
      public function §_-fE§()
      {
         super(gls("Поле"),true,true,null,true);
         this.init();
      }
      
      public static function §_-uS§() : void
      {
         var _loc1_:* = int(§_-21D§.length - 1);
         while(_loc1_ >= 0)
         {
            §_-21D§[_loc1_].hide();
            _loc1_--;
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         var _loc2_:int = §_-21D§.indexOf(this);
         if(_loc2_ != -1)
         {
            §_-21D§.splice(_loc2_,1);
         }
         super.hide(param1);
      }
      
      public function §_-f25§(param1:String, param2:int, param3:*, param4:Boolean = false, param5:int = 0) : void
      {
         this.caption = param1;
         this.type = param2;
         this.isClan = param4;
         this.entityId = param5;
         if(this.form != null)
         {
            this.form.removeEventListener("change",this.§_-E2o§);
         }
         if(this.isClan)
         {
            this.form = §_-z2g§.§_-Q2Y§(this.type);
         }
         else
         {
            this.form = §_-6Y§.§_-Q2Y§(this.type);
         }
         if(this.form != null)
         {
            this.form.addEventListener("change",this.§_-E2o§);
         }
         if(this.form != null)
         {
            this.form.load(param3);
         }
         var _loc6_:int = (this.form != null ? this.form.width : 0) + 20;
         var _loc7_:int = Math.min(this.form != null ? this.form.height : 0,§_-531§) + 20;
         if(!this.§_-M1N§)
         {
            this.§_-M1N§ = new ScrollPane();
         }
         this.§_-M1N§.source = this.form;
         this.§_-M1N§.setSize(_loc6_,_loc7_);
         this.§_-M1N§.x = 0;
         this.§_-M1N§.y = 5;
         addChild(this.§_-M1N§);
         place(this.§_-J2B§,this.§_-Z12§);
         this.§_-f2c§();
         show();
         if(§_-21D§.indexOf(this) == -1)
         {
            §_-21D§.push(this);
         }
      }
      
      private function init() : void
      {
         this.§_-J2B§ = new §_-j18§(gls("Сохранить"));
         this.§_-J2B§.addEventListener(MouseEvent.CLICK,this.§_-D1w§);
         this.§_-Z12§ = new §_-j18§(gls("Отмена"));
         this.§_-Z12§.§_-52e§();
         this.§_-Z12§.addEventListener(MouseEvent.CLICK,this.hide);
      }
      
      private function §_-f2c§() : void
      {
         var _loc1_:Number = this.§_-M1N§.y + this.§_-M1N§.height;
         var _loc2_:Number = Math.max(this.§_-J2B§.height,this.§_-Z12§.height);
         this.height = this.topOffset + _loc1_ + this.§_-JZ§ + _loc2_;
      }
      
      private function §_-E2o§(... rest) : void
      {
         if(!this.§_-M1N§ || !this.§_-M1N§.source)
         {
            return;
         }
         this.§_-M1N§.width = this.§_-M1N§.source.width + 20;
         this.§_-M1N§.height = Math.min(this.§_-M1N§.source.height,§_-531§) + 20;
         this.§_-M1N§.update();
         this.§_-f2c§();
      }
      
      private function §_-D1w§(param1:MouseEvent) : void
      {
         if(this.form == null)
         {
            return;
         }
         if(this.isClan)
         {
            §_-MZ§.§_-w2w§(this.entityId,this.type,this.form.save());
         }
         else
         {
            §_-MZ§.§_-oE§(this.entityId,this.type,this.form.save());
         }
         this.hide(param1);
      }
   }
}

