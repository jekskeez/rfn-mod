package §_-D1c§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class §_-Y2K§ extends §_-11t§
   {
      
      private var §_-g24§:TextField = new TextField();
      
      private var §_-kg§:TextField = new TextField();
      
      private var §_-H2i§:TextField = new TextField();
      
      private var §_-w26§:String;
      
      private var §_-yZ§:Number;
      
      private var §_-MX§:Number;
      
      public function §_-Y2K§(param1:String, param2:String, param3:Number = 1, param4:Number = NaN)
      {
         super();
         this.§_-w26§ = param2;
         this.§_-yZ§ = param3;
         this.§_-MX§ = param4;
         this.§_-H2i§.text = param1;
         §_-Y2P§(this.§_-H2i§);
         this.§_-H2i§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-H2i§.restrict = "-[0-9].";
         this.§_-H2i§.maxChars = 7;
         this.§_-H2i§.height = this.§_-H2i§.textHeight;
         addChild(this.§_-H2i§);
         this.§_-g24§.name = "x";
         this.§_-g24§.y = this.§_-H2i§.textHeight + 5;
         this.§_-g24§.width = 50;
         this.§_-g24§.height = 20;
         this.§_-g24§.background = true;
         this.§_-g24§.restrict = "-[0-9].";
         this.§_-g24§.maxChars = 7;
         this.§_-g24§.type = TextFieldType.INPUT;
         §_-Y2P§(this.§_-g24§,§_-L2F§);
         this.§_-g24§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         this.§_-g24§.selectable = true;
         this.§_-g24§.mouseEnabled = true;
         addChild(this.§_-g24§);
         this.§_-kg§.name = "y";
         this.§_-kg§.x = 75;
         this.§_-kg§.y = this.§_-H2i§.textHeight + 5;
         this.§_-kg§.width = 50;
         this.§_-kg§.height = 20;
         this.§_-kg§.background = true;
         this.§_-kg§.restrict = "-[0-9].";
         this.§_-kg§.maxChars = 7;
         this.§_-kg§.type = TextFieldType.INPUT;
         §_-Y2P§(this.§_-kg§,§_-L2F§);
         this.§_-kg§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         this.§_-kg§.selectable = true;
         addChild(this.§_-kg§);
      }
      
      override public function get inspectObject() : *
      {
         return super.inspectObject;
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.§_-g24§.text = String(param1[this.§_-w26§].x * this.§_-yZ§);
         this.§_-kg§.text = String(param1[this.§_-w26§].y * this.§_-yZ§);
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!isNaN(this.§_-MX§))
         {
            this.§_-g24§.text = Math.max(this.§_-MX§ * this.§_-yZ§,Number(this.§_-g24§.text)).toString();
            this.§_-kg§.text = Math.max(this.§_-MX§ * this.§_-yZ§,Number(this.§_-kg§.text)).toString();
         }
         this.inspectObject[this.§_-w26§] = this.inspectObject[this.§_-w26§] is b2Vec2 ? new b2Vec2(Number(this.§_-g24§.text) / this.§_-yZ§,Number(this.§_-kg§.text) / this.§_-yZ§) : new Point(Number(this.§_-g24§.text) / this.§_-yZ§,Number(this.§_-kg§.text) / this.§_-yZ§);
         dispatch();
      }
   }
}

